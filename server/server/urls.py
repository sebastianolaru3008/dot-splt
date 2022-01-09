"""server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import include
from django.contrib import admin
from django.urls import path
from  . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('v1/hello', views.HelloWorldView, name='hello'),
    path('v1/authenticate', views.authenticate, name='authenticate'),
    path('v1/upload',views.upload_bill, name='upload'),
    path('v1/getbill', views.get_bill, name='get_bill'),
    path('v1/editbill', views.edit_bill, name='edit_bill'),
    path('', include('bills.urls'))
]

from django.conf import settings
from django.conf.urls.static import static
if settings.DEBUG:
        urlpatterns += static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)