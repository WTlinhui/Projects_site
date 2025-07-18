from django.contrib import admin
from .models import Project, Customer
from django.contrib.admin.models import LogEntry

admin.site.register(Project)
admin.site.register(Customer)

@admin.register(LogEntry)
class LogEntryAdmin(admin.ModelAdmin):
    list_display = ['action_time', 'user', 'content_type', 'object_repr', 'action_flag']
    list_filter = ['action_flag', 'content_type', 'user']
    search_fields = ['object_repr', 'change_message']
    date_hierarchy = 'action_time'
