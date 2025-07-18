import base64
import pathlib
import re
from email import message_from_bytes
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from projects.models import Project
from mail_parser import split_projects_from_text
from .models import GmailToken
from django.utils.timezone import make_aware

BASE_DIR = pathlib.Path(__file__).resolve().parent.parent
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']


def get_credentials_for_user(user):
    try:
        token = GmailToken.objects.get(user=user)
        creds = Credentials(
            token=token.access_token,
            refresh_token=token.refresh_token,
            token_uri=token.token_uri,
            client_id=token.client_id,
            client_secret=token.client_secret,
            scopes=token.scopes.split(','),
            expiry=token.expiry,
        )
        if creds.expired and creds.refresh_token:
            creds.refresh(Request())
            token.access_token = creds.token
            token.expiry = make_aware(creds.expiry) if creds.expiry else None
            token.save()
        return creds
    except GmailToken.DoesNotExist:
        return None


def authenticate_gmail_api(user=None):
    """
    Gmail API認証してサービスオブジェクトを返す関数。
    userを指定するとDBのトークンから認証。
    指定なしの場合はtoken.jsonから読み込む開発用。
    """
    creds = None
    if user:
        creds = get_credentials_for_user(user)
    else:
        token_path = BASE_DIR / 'token.json'
        if token_path.exists():
            creds = Credentials.from_authorized_user_file(str(token_path), SCOPES)

    if not creds or not creds.valid:
        raise Exception("有効な認証情報がありません。認証を行ってください。")

    service = build('gmail', 'v1', credentials=creds)
    return service


def fetch_unread_messages(service, user_id='me'):
    try:
        response = service.users().messages().list(userId=user_id, q='is:unread').execute()
        return response.get('messages', [])
    except HttpError:
        return []


def get_message_detail(service, msg_id, user_id='me'):
    try:
        msg = service.users().messages().get(userId=user_id, id=msg_id, format='raw').execute()
        msg_raw = base64.urlsafe_b64decode(msg['raw'].encode('ASCII'))
        return message_from_bytes(msg_raw)
    except HttpError:
        return None


def extract_email_body(email_message):
    body = ""
    if email_message.is_multipart():
        for part in email_message.walk():
            if part.get_content_type() == 'text/plain' and 'attachment' not in str(part.get('Content-Disposition')):
                charset = part.get_content_charset() or 'utf-8'
                body = part.get_payload(decode=True).decode(charset, errors='ignore')
                break
    else:
        charset = email_message.get_content_charset() or 'utf-8'
        body = email_message.get_payload(decode=True).decode(charset, errors='ignore')
    return body


def clean_body(body):
    """
    メール本文から引用履歴などを除去する
    """
    cleaned_lines = []
    for line in body.splitlines():
        if not line.strip().startswith(('>', '>>')):
            cleaned_lines.append(line)
    return '\n'.join(cleaned_lines)


def process_emails(service):
    allowed_domains = ['nsd.co.jp', 'wisdom-technology.co.jp' ]  # @なしでドメイン指定

    messages = fetch_unread_messages(service)
    for msg in messages:
        email_message = get_message_detail(service, msg['id'])
        if not email_message:
            continue

        from_header = email_message.get('From', '')
        match = re.search(r'<(.+?)>', from_header)
        from_email = match.group(1) if match else from_header

        domain = from_email.split('@')[-1]
        if domain not in allowed_domains:
            continue

        body = extract_email_body(email_message)
        if not body:
            continue

        # 引用などを除去
        body = clean_body(body)

        for project_text in split_projects_from_text(body):
            if not Project.objects.filter(detail=project_text).exists():
                Project.objects.create(
                    customer_name=domain,
                    detail=project_text,
                    status='open'
                )
                print(f"登録案件内容:\n{project_text}\n---")

        # 既読にする
        try:
            service.users().messages().modify(
                userId='me',
                id=msg['id'],
                body={'removeLabelIds': ['UNREAD']}
            ).execute()
        except HttpError:
            pass

    return len(messages)
