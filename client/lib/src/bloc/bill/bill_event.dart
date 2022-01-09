import 'package:equatable/equatable.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/models/receipt/receipt_json.dart';

abstract class BillEvent extends Equatable {
  const BillEvent();
}

class SetBillEvent extends BillEvent {
  const SetBillEvent({required this.currentBill});

  final Bill currentBill;

  @override
  List<Object?> get props => [currentBill];
}

class SetProductQuantityEvent extends BillEvent {
  const SetProductQuantityEvent({required this.currentQuantity, required this.index});

  final num currentQuantity;
  final int index;

  @override
  List<Object?> get props => [currentQuantity, index];
}

class SetTotalEvent extends BillEvent {
  const SetTotalEvent({required this.total});

  final num total;

  @override
  List<Object?> get props => [total];
}

class SetReceiptEvent extends BillEvent {
  const SetReceiptEvent({required this.receipt});

  final Receipt receipt;

  @override
  List<Object?> get props => [receipt];
}
