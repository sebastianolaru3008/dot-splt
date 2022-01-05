// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      isCountable: json['isCountable'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'isCountable': instance.isCountable,
    };
