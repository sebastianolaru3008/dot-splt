import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:split/main.dart';
import 'package:split/src/components/top_app_bar/custom_top_app_bar.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/theme/typography.dart';
import 'package:split/src/utils/assets/image_finder.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  Future httpJob(AnimationController controller) async {
    controller.forward();
    int result = await appAuth.login(usernameController.text);
    await Future.delayed(
      const Duration(
        milliseconds: 700,
      ),
    );
    if (result != -1) {
      Navigator.of(context).pushReplacementNamed(Routes.homeScreenRoute);
    }
    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar.buildAppBar(
        context: context,
        title: "Login",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Spacer(),
            ImageFinder.loginIcon(),
            Spacer(),
            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter your username',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ProgressButton(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                strokeWidth: 3,
                child: Text("Login", style: CustomTypography.h6()),
                onPressed: (AnimationController controller) async {
                  await httpJob(controller);
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
