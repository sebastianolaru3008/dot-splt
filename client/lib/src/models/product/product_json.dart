import 'package:json_annotation/json_annotation.dart';

part 'product_json.g.dart';

@JsonSerializable()
class Product {
  Product(
      {required this.id, required this.name, required this.price, required this.quantity, required this.is_countable});

  final int id;
  final String name;
  final double price;
  final num quantity;
  final bool is_countable;

  Product copyWith({
    int? id,
    String? name,
    double? price,
    num? quantity,
    bool? is_countable,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        is_countable: is_countable ?? this.is_countable,
      );

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, quantity: $quantity, is_countable: $is_countable}';
  }
}
