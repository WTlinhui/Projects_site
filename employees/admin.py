from django.contrib import admin
from django.utils.html import format_html
from .models import Employee

@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('name', 'current_age', 'experience_years', 'recorded_at', 'short_introduction')
    readonly_fields = ('display_recorded_at',)

    # 編集・追加画面用：作成日＋説明
    def display_recorded_at(self, obj):
        if obj and obj.recorded_at:
            return format_html(
                '{}<br><small style="color:#555;">作成日から1年経過ごとに年齢と経験年数が自動で+1されます。</small>',
                obj.recorded_at.strftime('%Y-%m-%d')
            )
        else:
            return format_html(
                '<small style="color:#555;">※ 作成日は保存時に自動入力されます。<br>作成日から1年経過ごとに年齢と経験年数が自動で+1されます。</small>'
            )
    display_recorded_at.short_description = '作成日'

    # 年齢（毎年+1される）
    def current_age(self, obj):
        return obj.current_age
    current_age.short_description = '年齢'

    # 経験年数（毎年+1される）
    def experience_years(self, obj):
        return obj.experience_years
    experience_years.short_description = '経験年数'

    # 紹介文（一部表示）
    def short_introduction(self, obj):
        return obj.short_introduction()
    short_introduction.short_description = '紹介文（一部)'

    # フォームのフィールド並び順
    def get_fields(self, request, obj=None):
        fields = ['name', 'introduction', 'base_age', 'base_experience']
        if obj:  # 編集画面
            fields.append('display_recorded_at')
        else:  # 追加画面
            fields.append('display_recorded_at')
        return fields
