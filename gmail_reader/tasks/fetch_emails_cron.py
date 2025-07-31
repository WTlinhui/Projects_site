import os
import sys

sys.path.append('/home/ubuntu/SES_project')  # ← ses_site があるディレクトリを指定

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ses_site.settings')

import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ses_site.settings')
django.setup()

from django.contrib.auth.models import User
from gmail_reader.utils import get_credentials_for_user, process_emails
from googleapiclient.discovery import build
import logging

logger = logging.getLogger(__name__)
user = User.objects.get(username='linhui')  # ← 運用用ユーザーを指定（例: linlin）

creds = get_credentials_for_user(user)
if not creds:
    logger.warning("⚠️ Gmail 認証がまだ未完了")
    exit()

service = build('gmail', 'v1', credentials=creds)
count = process_emails(service, user)

logger.info(f"📦 cron定期処理で {count} 件のメールを抽出しました")
