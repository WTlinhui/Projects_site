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
    path('gmail/', include('gmail_reader.urls')),

    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/login/'), name='logout'),
]


