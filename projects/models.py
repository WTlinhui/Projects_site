from django.db import models

class Customer(models.Model):
    name = models.CharField(max_length=255, unique=True) 

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = "顧客"
        verbose_name_plural = "顧客一覧"

class Project(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    detail = models.TextField()
    status_choices = [('open', '募集中'), ('closed', '募集終了')]
    status = models.CharField(max_length=10, choices=status_choices)
    customer_person = models.CharField("顧客担当者名", max_length=100, blank=True, null=True)  # 任意

    def __str__(self):
        return f"{self.customer.name} | {self.detail[:45]}..."

    class Meta:
        verbose_name = "案件"
        verbose_name_plural = "案件一覧"
