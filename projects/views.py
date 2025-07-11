from django.shortcuts import render
from django.http import HttpResponse
from .models import Project
from django.db import models
import openpyxl
from openpyxl.styles import Alignment
from io import BytesIO

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

# ▼▼▼ ここを追加 ▼▼▼
def export_projects(request):
    if request.method == 'POST':
        selected_ids = request.POST.getlist('selected_ids')
        projects = Project.objects.filter(id__in=selected_ids)

        wb = openpyxl.Workbook()
        ws = wb.active
        ws.title = "案件一覧"

        # ヘッダー
        ws.append(['ID', '顧客名', '案件詳細'])

        # ヘッダー行を太字などにする場合はここで調整可能

        # データ行
        for p in projects:
            ws.append([
                p.id,
                p.customer_name,
                p.detail,
            ])

        # 「案件詳細」の列番号は3列目（C列）
        for row in ws.iter_rows(min_row=2, max_row=ws.max_row, min_col=3, max_col=3):
            for cell in row:
                cell.alignment = Alignment(wrap_text=True)

        # 列幅の調整（例）
        ws.column_dimensions['A'].width = 10  # ID列
        ws.column_dimensions['B'].width = 20  # 顧客名列
        ws.column_dimensions['C'].width = 50  # 案件詳細列（長文なので広めに）

        output = BytesIO()
        wb.save(output)
        output.seek(0)

        response = HttpResponse(
            output,
            content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        )
        response['Content-Disposition'] = 'attachment; filename=projects.xlsx'
        return response

    return HttpResponse("不正なリクエストです", status=400)