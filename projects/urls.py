from django.urls import path
from . import views

app_name = 'projects'

urlpatterns = [
    path('', views.project_list, name='project_list'),
    path('export_selected_gpt/', views.export_selected_projects_with_gpt, name='export_selected_projects_with_gpt'),
    path('customer/<int:customer_id>/projects/', views.projects_by_customer, name='projects_by_customer'),
]
