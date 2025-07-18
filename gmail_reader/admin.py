# gmail_reader/admin.py
from django.contrib import admin
from .models import GmailToken

@admin.register(GmailToken)
class GmailTokenAdmin(admin.ModelAdmin):
    list_display = ('user', 'expiry')
