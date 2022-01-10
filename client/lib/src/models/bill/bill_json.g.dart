// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      bill_id: json['bill_id'] as String? ?? "HQ1GL8",
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'bill_id': instance.bill_id,
      'products': instance.products,
    };
