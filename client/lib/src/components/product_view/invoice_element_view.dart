import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_state.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class InvoiceElementView extends StatefulWidget {
  const InvoiceElementView({Key? key, required this.productIndex}) : super(key: key);

  final int productIndex;

  @override
  State<InvoiceElementView> createState() => _InvoiceElementViewState();
}

class _InvoiceElementViewState extends State<InvoiceElementView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillBloc, BillState>(
      builder: (context, state) {
        return state.newBill.products[widget.productIndex].quantity != 0
            ? ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: Container(
                  decoration: BoxDecoration(
                    color: state.newBill.products[widget.productIndex].is_countable == true
                        ? Color(0xFFA5D6A7)
                        : Color(0xFFFFE0B2),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ImageFinder.infoIcon(
                        color: state.newBill.products[widget.productIndex].is_countable == true
                            ? Color(0xFF388E3C)
                            : Color(0xFFF57C00)),
                  ),
                ),
                title: SizedBox(
                  width: 100.0,
                  child: Text(
                    state.newBill.products[widget.productIndex].name,
                    style: CustomTypography.h6().copyWith(color: CustomColor.greysLevel5),
                  ),
                ),
                subtitle: SizedBox(
                  width: 100.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.newBill.products[widget.productIndex].is_countable
                            ? "buc " + (state.newBill.products[widget.productIndex].quantity).toInt().toString()
                            : state.newBill.products[widget.productIndex].quantity.toString() + " kg",
                      ),
                      Text(
                        (state.newBill.products[widget.productIndex].quantity *
                                    state.newBill.products[widget.productIndex].price)
                                .toString() +
                            " lei",
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }
}
