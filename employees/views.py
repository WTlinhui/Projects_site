from django.shortcuts import render
from .models import Employee

def employee_list(request):
    employees = Employee.objects.all()
    split_index = (len(employees) + 1) // 2  # 奇数なら左に多くなる

    left_employees = employees[:split_index]
    right_employees = employees[split_index:]

    return render(request, 'employees/employee_list.html', {
        'left_employees': left_employees,
        'right_employees': right_employees,
    })
