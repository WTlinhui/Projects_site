# gmail_reader/models.py
from django.db import models
from django.contrib.auth.models import User

class GmailToken(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='gmail_token')
    access_token = models.TextField()
    refresh_token = models.TextField()
    token_uri = models.CharField(max_length=255)
    client_id = models.CharField(max_length=255)
    client_secret = models.CharField(max_length=255)
    scopes = models.TextField()  # 例えばJSONやカンマ区切りなどで保存
    expiry = models.DateTimeField(null=True, blank=True)  # トークンの有効期限日時

    def __str__(self):
        return f"{self.user.username} Gmail Token"
