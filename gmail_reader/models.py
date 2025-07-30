# gmail_reader/models.py
from django.db import models
from django.contrib.auth.models import User

class GmailToken(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='gmail_token')
    access_token = models.TextField()
    refresh_token = models.CharField(max_length=255, null=True)
    token_uri = models.CharField(max_length=255)
    client_id = models.CharField(max_length=255)
    client_secret = models.CharField(max_length=255)
    scopes = models.TextField()  # JSONやカンマ区切りなどで保存
    expiry = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"{self.user.username} Gmail Token"


class ImportedMail(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message_id = models.CharField(max_length=128, unique=True)  # GmailのMessage ID
    subject = models.CharField(max_length=255, null=True, blank=True)
    sender = models.EmailField()
    received_at = models.DateTimeField()
    snippet = models.TextField(null=True, blank=True)
    body = models.TextField(null=True, blank=True)
    is_read = models.BooleanField(default=True)
    is_processed = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.subject or '(No Subject)'} from {self.sender}"
