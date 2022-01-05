import 'package:json_annotation/json_annotation.dart';
import 'package:split/src/models/product/product_json.dart';

part 'bill_json.g.dart';

@JsonSerializable()
class Bill {
  Bill({required this.billId, required this.products});

  final String billId;
  final List<Product> products;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
