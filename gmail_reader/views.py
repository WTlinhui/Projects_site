import os
from django.conf import settings
from django.http import HttpResponse
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from google_auth_oauthlib.flow import Flow
from googleapiclient.discovery import build
from .models import GmailToken
from .utils import process_emails, get_credentials_for_user

@login_required
def authorize(request):
    flow = Flow.from_client_secrets_file(
        os.path.join(settings.BASE_DIR, 'credentials.json'),
        scopes=['https://www.googleapis.com/auth/gmail.readonly'],
        redirect_uri=request.build_absolute_uri('/oauth2callback/')
    )
    authorization_url, state = flow.authorization_url(
        access_type='offline',
        include_granted_scopes='true'
    )
    request.session['state'] = state
    return redirect(authorization_url)

@login_required
def oauth2callback(request):
    state = request.session.get('state')
    flow = Flow.from_client_secrets_file(
        os.path.join(settings.BASE_DIR, 'credentials.json'),
        scopes=['https://www.googleapis.com/auth/gmail.readonly'],
        state=state,
        redirect_uri=request.build_absolute_uri('/oauth2callback/')
    )
    flow.fetch_token(authorization_response=request.build_absolute_uri())
    credentials = flow.credentials

    GmailToken.objects.update_or_create(
        user=request.user,
        defaults={
            'access_token': credentials.token,
            'refresh_token': credentials.refresh_token,
            'token_uri': credentials.token_uri,
            'client_id': credentials.client_id,
            'client_secret': credentials.client_secret,
            'scopes': ','.join(credentials.scopes),
            'expiry': credentials.expiry,
        }
    )

    return HttpResponse("認証が完了しました。トークンを保存しました。")

@login_required
def fetch_emails_view(request):
    creds = get_credentials_for_user(request.user)
    if not creds:
        return HttpResponse("Gmail認証が必要です。", status=401)
    service = build('gmail', 'v1', credentials=creds)
    count = process_emails(service, request.user)
    return HttpResponse(f"{count} 件の未読メールを処理しました。")
