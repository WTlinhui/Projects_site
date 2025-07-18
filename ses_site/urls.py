# ses_site/urls.py

from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect
from django.contrib.auth import views as auth_views
from employees import views as employees_views
from gmail_reader import views as gmail_views

urlpatterns = [
    path('', lambda request: redirect('projects:project_list')),
    path('admin/', admin.site.urls),
    path('projects/', include(('projects.urls', 'projects'), namespace='projects')),
    path('employees/', employees_views.employee_list, name='employee_list'),
    path('gmail_reader/', include('gmail_reader.urls')),

    # ログイン・ログアウト
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/login/'), name='logout'),

    # Gmail認証関連
    path('authorize/', gmail_views.authorize, name='authorize'),
    path('oauth2callback/', gmail_views.oauth2callback, name='oauth2callback'),
    path('fetch-emails/', gmail_views.fetch_emails_view, name='fetch_emails'),
]


