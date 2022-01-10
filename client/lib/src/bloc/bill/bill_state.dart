import 'package:equatable/equatable.dart';
import 'package:split/src/models/bill/bill_json.dart';

class BillState extends Equatable {
  const BillState(
      {this.total = 0, this.originalBill = const Bill(bill_id: "ceva"), this.newBill = const Bill(bill_id: "ceva")});

  const BillState.initial(
      {this.total = 0, this.originalBill = const Bill(bill_id: "ceva"), this.newBill = const Bill(bill_id: "ceva")});

  final Bill originalBill;
  final Bill newBill;
  final double total;

  @override
  List<Object?> get props => [originalBill, newBill];
}
