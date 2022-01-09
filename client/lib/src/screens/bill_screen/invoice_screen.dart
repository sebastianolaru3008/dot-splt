import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_state.dart';
import 'package:split/src/components/product_view/invoice_element_view.dart';
import 'package:split/src/components/top_app_bar/custom_top_app_bar.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar.buildAppBar(
          context: context,
          title: "Bill",
          onBackButtonPress: () {
            Navigator.of(context).pushReplacementNamed(Routes.homeScreenRoute);
          }),
      body: BlocBuilder<BillBloc, BillState>(
        builder: (BuildContext context, BillState state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bill no.",
                      style: CustomTypography.h2().copyWith(
                        color: CustomColor.black4(),
                      ),
                    ),
                    Text(
                      " #" + state.originalBill.bill_id.toString(),
                      style: CustomTypography.h5().copyWith(
                        color: CustomColor.greysLevel3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  clipBehavior: Clip.hardEdge,
                  shrinkWrap: true,
                  itemCount: state.originalBill.products.length,
                  itemBuilder: (BuildContext context, int index) => InvoiceElementView(
                    productIndex: index,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: MediaQuery.of(context).viewPadding.bottom),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: CustomTypography.h5().copyWith(
                          color: CustomColor.black4(),
                        ),
                      ),
                      Text(
                        state.total.toStringAsFixed(2) + " lei",
                        style: CustomTypography.h5().copyWith(
                          color: CustomColor.greysLevel4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
