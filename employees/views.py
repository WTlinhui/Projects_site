from django.shortcuts import render
from .models import Employee

def employee_list(request):
    employees = Employee.objects.all()
    left_employees = employees[:len(employees)//2]
    right_employees = employees[len(employees)//2:]
    return render(request, 'employees/employee_list.html', {
        'left_employees': left_employees,
        'right_employees': right_employees,
    })
