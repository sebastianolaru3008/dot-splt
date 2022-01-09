import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_event.dart';
import 'package:split/src/bloc/bill/bill_state.dart';
import 'package:split/src/components/counter.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.productIndex, this.isReadOnly = false}) : super(key: key);

  final int productIndex;
  final bool isReadOnly;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillBloc, BillState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          leading: Container(
            decoration: BoxDecoration(
              color: state.originalBill.products[widget.productIndex].is_countable == true
                  ? Color(0xFFA5D6A7)
                  : Color(0xFFFFE0B2),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageFinder.infoIcon(
                  color: state.originalBill.products[widget.productIndex].is_countable == true
                      ? Color(0xFF388E3C)
                      : Color(0xFFF57C00)),
            ),
          ),
          title: SizedBox(
            width: 100.0,
            child: Text(
              state.originalBill.products[widget.productIndex].name,
              style: CustomTypography.h6().copyWith(color: CustomColor.greysLevel5),
            ),
          ),
          subtitle: SizedBox(
            width: 100.0,
            child: Text(
              state.originalBill.products[widget.productIndex].is_countable
                  ? "buc " + state.originalBill.products[widget.productIndex].quantity.toString()
                  : state.originalBill.products[widget.productIndex].quantity.toString() + " kg",
            ),
          ),
          trailing: !widget.isReadOnly
              ? Opacity(
                  opacity: state.originalBill.products[widget.productIndex].quantity == 0 ? 0.3 : 1.0,
                  child: AbsorbPointer(
                    absorbing: state.originalBill.products[widget.productIndex].quantity == 0,
                    child: SizedBox(
                      width: 80.0,
                      child: state.originalBill.products[widget.productIndex].is_countable == true
                          ? Counter(
                              key: Key(widget.productIndex.toString()),
                              initialValue: state.newBill.products[widget.productIndex].quantity,
                              minValue: 0,
                              maxValue: state.originalBill.products[widget.productIndex].quantity,
                              textStyle: CustomTypography.h6().copyWith(color: CustomColor.black4()),
                              onChanged: (num value) {
                                BlocProvider.of<BillBloc>(context).add(
                                  SetProductQuantityEvent(
                                    currentQuantity: value,
                                    index: widget.productIndex,
                                  ),
                                );
                                setState(() {});
                              },
                              color: Color(0xFFB3E5FC),
                              iconColor: Color(0xFF1565C0),
                              decimalPlaces: 0,
                            )
                          : TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: '0.0',
                                hintStyle: CustomTypography.h6().copyWith(color: CustomColor.black4()),
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
