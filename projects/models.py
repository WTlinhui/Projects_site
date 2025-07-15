from django.db import models

class Project(models.Model):
    customer_name = models.CharField(max_length=100)
    detail = models.TextField()
    status_choices = [('open', '募集中'), ('closed', '募集終了')]
    status = models.CharField(max_length=10, choices=status_choices)

    def __str__(self):
        return f"{self.customer_name} | {self.detail[:45]}..."

    class Meta:
        verbose_name = "案件"
        verbose_name_plural = "案件"
