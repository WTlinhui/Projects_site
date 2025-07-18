# gmail_reader/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('authorize/', views.authorize, name='authorize'),
    path('oauth2callback/', views.oauth2callback, name='oauth2callback'),
    path('fetch-emails/', views.fetch_emails_view, name='fetch_emails'),
]
