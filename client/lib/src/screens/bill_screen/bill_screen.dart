import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_event.dart';
import 'package:split/src/bloc/bill/bill_state.dart';
import 'package:split/src/components/product_view/product_view.dart';
import 'package:split/src/components/top_app_bar/custom_top_app_bar.dart';
import 'package:split/src/config/config.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/models/receipt/receipt_json.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/services/billing_service.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  late final WebSocketChannel _channel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://' +
          Config.WEBSOCKET_HOST +
          '/ws/bill-room/' +
          BlocProvider.of<BillBloc>(context).state.originalBill.bill_id),
    );
    _channel.stream.listen((data) {
      BlocProvider.of<BillBloc>(context).add(
        UpdateBillEvent(
          currentBill: Bill.fromJson(json.decode(data) as Map<String, dynamic>),
        ),
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

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
                  itemBuilder: (BuildContext context, int index) => ProductView(
                    productIndex: index,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Platform.isIOS
                      ? Size.fromHeight(32 + MediaQuery.of(context).viewPadding.bottom)
                      : Size.fromHeight(50 + MediaQuery.of(context).viewPadding.bottom),
                  elevation: 1,
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: Platform.isIOS ? 16.0 : 0.0),
                  child: Text('Send Invoice', style: CustomTypography.h6()),
                ),
                onPressed: () {
                  BillingService.sendBillWithUserId(
                    token: state.newBill.bill_id,
                    products: state.newBill.products,
                  ).then(
                    (Receipt receipt) {
                      BlocProvider.of<BillBloc>(context).add(SetReceiptEvent(receipt: receipt));
                      _channel.sink.add(
                        json.encode(
                          Bill(bill_id: receipt.bill_id, products: receipt.products).toJson(),
                        ),
                      );

                      Navigator.of(context).pushReplacementNamed(Routes.invoiceScreenRoute);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
