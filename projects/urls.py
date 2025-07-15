from django.urls import path
from . import views

urlpatterns = [
    path('', views.project_list, name='project_list'),
    path('export_selected_gpt/', views.export_selected_projects_with_gpt, name='export_selected_projects_with_gpt'),
]
