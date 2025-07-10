from django.shortcuts import render
from .models import Project
from django.db import models

def project_list(request):
    status_filter = request.GET.get('status')
    keyword = request.GET.get('keyword')

    projects = Project.objects.all()

    if status_filter in ['open', 'closed']:
        projects = projects.filter(status=status_filter)

    if keyword:
        projects = projects.filter(
            models.Q(customer_name__icontains=keyword) |
            models.Q(detail__icontains=keyword)
        )

    context = {'projects': projects}
    return render(request, 'projects/project_list.html', context)
