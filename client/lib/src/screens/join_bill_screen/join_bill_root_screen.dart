import 'package:flutter/material.dart';
import 'package:split/src/theme/colors.dart';

class JoinBillRootScreen extends StatelessWidget {
  const JoinBillRootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.blue3(),
        title: Text("Join a bill"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Bill Token',
                      hintText: 'Enter here your bill token'),
                ),
              ),
              ElevatedButton(
                child: SizedBox(
                  height: 48.0,
                  child: Center(
                    child: Text("Join"),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
