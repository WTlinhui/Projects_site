from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect
from django.contrib.auth import views as auth_views
from employees import views as employees_views

urlpatterns = [
    path('', lambda request: redirect('projects/')),
    path('admin/', admin.site.urls),
    path('projects/', include('projects.urls')),
    path('employees/', employees_views.employee_list, name='employee_list'),

    # 追加：ログイン・ログアウトURL
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/login/'), name='logout'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/login/'), name='logout'),
]
