// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receipt _$ReceiptFromJson(Map<String, dynamic> json) => Receipt(
      total_cost: (json['total_cost'] as num?)?.toDouble() ?? 0.0,
      bill_id: json['bill_id'] as String? ?? "HQ1GL8",
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReceiptToJson(Receipt instance) => <String, dynamic>{
      'bill_id': instance.bill_id,
      'products': instance.products,
      'total_cost': instance.total_cost,
    };
