from collections import Counter
from django.http import HttpResponse
from django.core import serializers
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from rest_framework.decorators import api_view
from rest_framework.response import Response
from server.db import create_new_bill, create_new_user
import json
from server.ocr import img_to_bill
from server.models import Bill, Payments, Product, User
from server.serializers import BillSerializer, ProductSerializer, UserSerializer


@api_view(http_method_names=['GET'])
@csrf_exempt  # To exempt from default requirement for CSRF tokens to use postman
def HelloWorldView(request):
    return HttpResponse("Hello World!")


@api_view(http_method_names=['POST'])
def authenticate(request): 
    params = json.loads(request.body.decode())
    user = User.objects.filter(name=params['name'])
    id = -1
    if len(user) == 0:
        id = create_new_user(params['name'])
    else:
        id = user[0].id
    response = {"user_id":id}
    return Response(response)


@api_view(http_method_names=['POST'])
def upload_bill(request):
    decoded = request.POST
    file = request.FILES['bill']
    products = img_to_bill(file)
    bill_id = create_new_bill(decoded['author'], products)
    return Response(get_products_response(bill_id))


def get_products_response(billid):
    bill = Bill.objects.get(some_id=billid)
    products = Product.objects.filter(bill_id=bill)
    products = [ProductSerializer(p).data for p in products]
    response = {"bill_id": billid, "products": products}
    return response


@api_view(http_method_names=['GET'])
def get_bill(request):
    return Response(get_products_response(request.GET['bill_id']))


@api_view(http_method_names=['POST'])
def edit_bill(request):
    params = json.loads(request.body.decode())
    user = User.objects.get(pk=params['user_id'])
    print(UserSerializer(user).data)
    bill = Bill.objects.get(some_id=params['bill_id'])
    print(BillSerializer(bill).data)
    products = params['products']
    total = 0
    for p in products:
        total += p['price'] * p['quantity']
        current = Product.objects.get(pk=p['id'])
        current.quantity = current.quantity - p['quantity']
        current.save()
        payment = Payments(user_id=user, product_id=current, quantity=p["quantity"])
        payment.save()
    response = get_products_response(params['bill_id'])
    response['total_cost'] = total
    return Response(response)


