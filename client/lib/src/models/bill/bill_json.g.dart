// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      billId: json['billId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'billId': instance.billId,
      'products': instance.products,
    };
