# gmail_reader/management/commands/gmail_reader.py

from django.core.management.base import BaseCommand
from gmail_reader.utils import authenticate_gmail_api, process_emails

class Command(BaseCommand):
    help = 'Gmailの未読メールを読み取ってDBに案件を保存する'

    def handle(self, *args, **options):
        service = authenticate_gmail_api()
        count = process_emails(service)
        self.stdout.write(self.style.SUCCESS(f"{count} 件の未読メールを処理しました。"))
