from rest_framework import serializers

class UserSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=50)

class BillSerializer(serializers.Serializer):
    author = UserSerializer()

class ProductSerializer(serializers.Serializer):
    id = serializers.ReadOnlyField()
    name = serializers.CharField(max_length=100)
    price = serializers.FloatField()
    quantity = serializers.FloatField() 
    is_countable = serializers.BooleanField()

class Payments(serializers.Serializer):
    user_id = UserSerializer()
    product_id = ProductSerializer()
    quantity = serializers.FloatField()