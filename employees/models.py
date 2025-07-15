from django.utils import timezone
from django.db import models

class Employee(models.Model):
    name = models.CharField('氏名', max_length=100)
    introduction = models.TextField('紹介文')

    base_age = models.PositiveIntegerField('年齢初期値')
    base_industry_year = models.PositiveIntegerField('入業年初期値')  # 例：2018

    recorded_at = models.DateField('作成日', auto_now_add=True)

    @property
    def current_age(self):
        today = timezone.now().date()
        delta = today.year - self.recorded_at.year
        if (today.month, today.day) < (self.recorded_at.month, self.recorded_at.day):
            delta -= 1
        return self.base_age + max(delta, 0)

    @property
    def experience_years(self):
        today = timezone.now().date()
        return max(today.year - self.base_industry_year, 0)

    def short_introduction(self):
        return (self.introduction[:50] + '...') if len(self.introduction) > 50 else self.introduction
    short_introduction.short_description = '紹介文（一部）'

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "社員"
        verbose_name_plural = "社員"
