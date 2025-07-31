import base64
import pathlib
import re
from email import message_from_bytes
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from projects.models import Project
from projects.models import Customer
from .models import GmailToken, ImportedMail
from django.utils.timezone import make_aware
from django.utils.timezone import make_naive
import datetime

# === 抽出キーワード定義＆分割関数 ===

PROJECT_KEYWORDS = [
    "案件", "概要", "人数", "期間", "時期", "工程",
    "スキル", "場所", "勤務地", "面談", "単価",
    "開始", "終了", "担当", "顧客", "募集", "条件", "対応内容"
]

def split_projects_from_text(text):
    blocks = re.split(r'[-ー_*~=]{5,}', text)

    projects = []
    for block in blocks:
        block = block.strip()
        if not block or len(block) < 30:  # ← 罫線だけや短すぎるのを除外
            continue

        sub_blocks = re.split(r'\[案件\d+\]|【案件\d+】|■案件\d+|◆案件\d+|●案件\d+|案件：|【案\s*件】', block)

        for sub_block in sub_blocks:
            sub_block = sub_block.strip()
            if not sub_block or len(sub_block) < 30:  # ← こちらも同様に除外
                continue

            keyword_count = sum(k in sub_block for k in PROJECT_KEYWORDS)

            if keyword_count >= 3:
                projects.append(sub_block)

    return projects



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
            expiry=make_naive(token.expiry) if token.expiry else None,
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
    creds = get_credentials_for_user(user) if user else None
    if not creds:
        token_path = BASE_DIR / 'token.json'
        if token_path.exists():
            creds = Credentials.from_authorized_user_file(str(token_path), SCOPES)
    if not creds or not creds.valid:
        raise Exception("有効な認証情報がありません。認証を行ってください。")
    return build('gmail', 'v1', credentials=creds)


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
        return message_from_bytes(msg_raw), msg.get('internalDate')
    except HttpError:
        return None, None


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
    return '\n'.join([line for line in body.splitlines() if not line.strip().startswith(('>', '>>'))])


DOMAIN_TO_CUSTOMER = {
    'wisdom-technology.co.jp': 'WT',
    'nsd.co.jp': 'NSD',
    'dts.co.jp': 'DTS',
}

def process_emails(service, user):
    allowed_domains = DOMAIN_TO_CUSTOMER.keys()
    messages = fetch_unread_messages(service)
    count = 0

    for msg in messages:
        message_id = msg['id']

        if ImportedMail.objects.filter(user=user, message_id=message_id).exists():
            continue

        email_message, internal_date = get_message_detail(service, message_id)
        if not email_message or not internal_date:
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

        cleaned_body = clean_body(body)
        subject = email_message.get('Subject', '(No Subject)')
        received_at = make_aware(datetime.datetime.fromtimestamp(int(internal_date) / 1000))

        ImportedMail.objects.create(
            user=user,
            message_id=message_id,
            subject=subject,
            sender=from_email,
            received_at=received_at,
            body=cleaned_body,
            is_processed=False
        )

        # 顧客レコード取得（Customer モデルから）
        customer_code = DOMAIN_TO_CUSTOMER.get(domain)
        try:
            customer = Customer.objects.get(name=customer_code)
        except Customer.DoesNotExist:
            print(f"⚠️ 顧客 '{customer_code}' が Customer テーブルに存在しません。")
            continue

        # 案件抽出・登録処理
        projects = split_projects_from_text(cleaned_body)
        print(f"📌 抽出された案件数: {len(projects)}")

        for project_text in projects:
            if not project_text.strip():
                continue

            if not Project.objects.filter(detail=project_text).exists():
                Project.objects.create(
                    customer=customer,
                    detail=project_text,
                    status='open'
                )
                print(f"✅ 登録済み案件:\n{project_text}\n---")

        count += 1

    return count
