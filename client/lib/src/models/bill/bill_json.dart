import 'package:json_annotation/json_annotation.dart';
import 'package:split/src/models/product/product_json.dart';

part 'bill_json.g.dart';

@JsonSerializable()
class Bill {
  const Bill({this.bill_id = "HQ1GL8", this.products = const []});

  final String bill_id;
  final List<Product> products;

  Bill copyWith({String? bill_id, List<Product>? products}) =>
      Bill(bill_id: bill_id ?? this.bill_id, products: products ?? this.products);

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);

  @override
  String toString() {
    return 'Bill{bill_id: $bill_id, products: $products}';
  }
}
