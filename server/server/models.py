import uuid
from django.db import models


class User(models.Model):
    name = models.CharField(max_length=50)


class Bill(models.Model):
    author = models.ForeignKey(User, on_delete=models.RESTRICT)
    some_id = models.CharField(max_length=10)


class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()
    quantity = models.FloatField()
    is_countable = models.BooleanField()
    bill_id = models.ForeignKey(Bill, on_delete=models.RESTRICT)


class Payments(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.RESTRICT)
    product_id = models.ForeignKey(Product, on_delete=models.RESTRICT)
    quantity = models.FloatField()
