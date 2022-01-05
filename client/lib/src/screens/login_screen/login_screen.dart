import 'package:flutter/material.dart';
import 'package:split/main.dart';
import 'package:split/src/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _status = 'no-action';
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.blue3(),
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 300.0,
              ),
              TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter your username'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text('Login'),
                  onPressed: () {
                    appAuth.login(usernameController.text).then(
                      (result) {
                        if (result != -1) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          setState(() => _status = 'rejected');
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 200.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
