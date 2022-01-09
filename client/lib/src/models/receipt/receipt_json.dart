import 'package:json_annotation/json_annotation.dart';
import 'package:split/src/models/product/product_json.dart';

part 'receipt_json.g.dart';

@JsonSerializable()
class Receipt {
  const Receipt({this.total_cost = 0.0, this.bill_id = "HQ1GL8", this.products = const []});

  final String bill_id;
  final List<Product> products;
  final double total_cost;

  Receipt copyWith({String? bill_id, List<Product>? products}) =>
      Receipt(bill_id: bill_id ?? this.bill_id, products: products ?? this.products);

  factory Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
