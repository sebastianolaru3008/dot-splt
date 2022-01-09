import 'package:bloc/bloc.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/models/product/product_json.dart';

import 'bill_event.dart';
import 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  BillBloc() : super(const BillState.initial()) {
    on<SetBillEvent>((SetBillEvent event, Emitter<BillState> emit) => _changeBill(event, emit));
    on<SetProductQuantityEvent>(
        (SetProductQuantityEvent event, Emitter<BillState> emit) => _changeProductQuantity(event, emit));
    on<SetTotalEvent>((SetTotalEvent event, Emitter<BillState> emit) => _changeTotal(event, emit));
    on<SetReceiptEvent>((SetReceiptEvent event, Emitter<BillState> emit) => _changeAll(event, emit));
  }

  void _changeBill(SetBillEvent event, Emitter<BillState> emit) {
    emit(
      BillState(
        originalBill: event.currentBill,
        newBill: event.currentBill.copyWith(
          products: event.currentBill.products
              .map(
                (Product prod) => prod.copyWith(
                  quantity: 0.0,
                ),
              )
              .toList(),
        ),
        total: 0.0,
      ),
    );
  }

  void _changeProductQuantity(SetProductQuantityEvent event, Emitter<BillState> emit) {
    Bill nextState = state.newBill;
    nextState.products[event.index] = nextState.products[event.index].copyWith(quantity: event.currentQuantity);
    emit(
      BillState(
        originalBill: state.originalBill,
        newBill: state.newBill,
      ),
    );
  }

  void _changeTotal(SetTotalEvent event, Emitter<BillState> emit) {
    emit(BillState(originalBill: state.originalBill, newBill: state.newBill));
  }

  @override
  void onChange(Change<BillState> change) {
    super.onChange(change);
    // print(change);
  }

  void _changeAll(SetReceiptEvent event, Emitter<BillState> emit) {
    emit(
      BillState(
        originalBill: Bill(bill_id: event.receipt.bill_id, products: event.receipt.products),
        newBill: state.newBill,
        total: event.receipt.total_cost,
      ),
    );
  }
}
