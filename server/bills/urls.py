from django.urls import path

from .views import index, index2, index3

urlpatterns = [
    path('',  index),
    path('2', index2),
    path('3', index3)
]
