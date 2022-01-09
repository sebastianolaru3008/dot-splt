import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/bloc/bill/bill_event.dart';
import 'package:split/src/components/top_app_bar/custom_top_app_bar.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/services/billing_service.dart';
import 'package:split/src/theme/typography.dart';

class CreateBillRootScreen extends StatefulWidget {
  const CreateBillRootScreen({Key? key}) : super(key: key);

  @override
  State<CreateBillRootScreen> createState() => _CreateBillRootScreenState();
}

class _CreateBillRootScreenState extends State<CreateBillRootScreen> {
  Future httpJob(AnimationController controller, ImageSource source) async {
    controller.forward();
    final Bill bill = await BillingService.requestBillByImage(source);
    BlocProvider.of<BillBloc>(context).add(
      SetBillEvent(currentBill: bill.copyWith()),
    );
    Navigator.of(context).pushReplacementNamed(Routes.billScreenRoute);
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomTopAppBar.buildAppBar(context: context, title: "Create bill"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ProgressButton(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  strokeWidth: 3,
                  child: Text(
                    "Upload image",
                    style: CustomTypography.h6(),
                  ),
                  onPressed: (AnimationController controller) async {
                    httpJob(controller, ImageSource.gallery);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ProgressButton(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  strokeWidth: 3,
                  child: Text(
                    "Take a photo",
                    style: CustomTypography.h6(),
                  ),
                  onPressed: (AnimationController controller) async {
                    httpJob(controller, ImageSource.camera);
                  },
                ),
              ),
              Spacer()
            ],
          ),
        ));
  }
}
