import os
import django
import imaplib
import email
from email.header import decode_header
from email.utils import parseaddr
from pathlib import Path
from dotenv import load_dotenv

# Django設定の読み込み
import sys
sys.path.append(str(Path(__file__).resolve().parent))  # プロジェクトのルートパスを追加
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ses_site.settings')
django.setup()

from projects.models import Project  # あなたのアプリ名・モデルに合わせて調整してください

# 自作パーサーの読み込み
from mail_parser import split_projects_from_text

# .env読み込み
load_dotenv(dotenv_path=Path(__file__).resolve().parent / ".env")

IMAP_HOST = os.getenv("IMAP_HOST")
IMAP_USER = os.getenv("IMAP_USER")
IMAP_PASS = os.getenv("IMAP_PASS")
IMAP_PORT = 993

def fetch_emails_and_register_projects(allowed_domains):
    mail = imaplib.IMAP4_SSL(IMAP_HOST, IMAP_PORT)
    mail.login(IMAP_USER, IMAP_PASS)
    mail.select("inbox")

    # 未読メール検索
    result, data = mail.search(None, 'UNSEEN')
    mail_ids = data[0].split()

    print(f"未読メール数: {len(mail_ids)}")

    for i in mail_ids:
        result, msg_data = mail.fetch(i, '(RFC822)')
        raw_email = msg_data[0][1]
        msg = email.message_from_bytes(raw_email)

        from_header = msg.get("From", "")
        from_email = parseaddr(from_header)[1]
        # 顧客ドメイン指定チェック
        if not any(from_email.endswith(domain) for domain in allowed_domains):
            continue

        # 件名デコード（必要あれば）
        subject, encoding = decode_header(msg.get("Subject", ""))[0]
        if isinstance(subject, bytes):
            subject = subject.decode(encoding if encoding else "utf-8")

        # 本文取得（テキストのみ）
        body = ""
        if msg.is_multipart():
            for part in msg.walk():
                ctype = part.get_content_type()
                cdispo = str(part.get('Content-Disposition'))

                if ctype == 'text/plain' and 'attachment' not in cdispo:
                    charset = part.get_content_charset() or 'utf-8'
                    body = part.get_payload(decode=True).decode(charset, errors='ignore')
                    break
        else:
            charset = msg.get_content_charset() or 'utf-8'
            body = msg.get_payload(decode=True).decode(charset, errors='ignore')

        # 案件ごとに分割
        projects_texts = split_projects_from_text(body)

        print(f"メール件名: {subject}")
        print(f"案件数: {len(projects_texts)}")

        # DB登録
        for project_text in projects_texts:
            # 既に同じ案件詳細が登録済みなら重複登録しない処理も後で追加可能
            p = Project(
                customer_name=from_email.split("@")[-1],
                detail=project_text,
                status='open',
            )
            p.save()
            print(f"案件登録: {p}")

        # 必要なら既読にする
        # mail.store(i, '+FLAGS', '\\Seen')

    mail.logout()

if __name__ == "__main__":
    allowed_domains = ['@nsd.co.jp', '@wisdom-technology.co.jp']
    fetch_emails_and_register_projects(allowed_domains)
