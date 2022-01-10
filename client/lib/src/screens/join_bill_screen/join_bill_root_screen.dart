import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_event.dart';
import 'package:split/src/components/top_app_bar/custom_top_app_bar.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/services/billing_service.dart';
import 'package:split/src/theme/typography.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class JoinBillRootScreen extends StatefulWidget {
  const JoinBillRootScreen({Key? key}) : super(key: key);

  @override
  State<JoinBillRootScreen> createState() => _JoinBillRootScreenState();
}

class _JoinBillRootScreenState extends State<JoinBillRootScreen> {
  TextEditingController tokenController = TextEditingController();

  Future httpJob(AnimationController controller) async {
    controller.forward();
    if (tokenController.text == "") {
      controller.reset();
      return Future;
    }
    Bill bill = await BillingService.requestBillProducts(token: tokenController.text);
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    BlocProvider.of<BillBloc>(context).add(
      SetBillEvent(currentBill: bill.copyWith()),
    );
    Navigator.of(context).pushReplacementNamed(Routes.billScreenRoute);
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar.buildAppBar(context: context, title: "Join bill"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              ImageFinder.joinIcon(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: TextField(
                  controller: tokenController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Bill Token', hintText: 'Enter here your bill token'),
                ),
              ),
              ProgressButton(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                strokeWidth: 3,
                child: Text(
                  "Join bill",
                  style: CustomTypography.h6(),
                ),
                onPressed: (AnimationController controller) async {
                  httpJob(controller);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
