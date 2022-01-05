import 'package:json_annotation/json_annotation.dart';

part 'product_json.g.dart';

@JsonSerializable()
class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.isCountable});

  final int id;
  final String name;
  final double price;
  final double quantity;
  final bool isCountable;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
