import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split/src/bloc/bill/bill_bloc.dart';
import 'package:split/src/navigation/routes/routes.dart';
import 'package:split/src/screens/bill_screen/bill_screen.dart';
import 'package:split/src/screens/bill_screen/invoice_screen.dart';
import 'package:split/src/screens/login_screen/login_screen.dart';
import 'package:split/src/screens/main_screen.dart';
import 'package:split/src/services/auth_service.dart';

AuthService appAuth = AuthService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FIXME : remove this after finished login
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('user_id');

  // Set default home.
  Widget _defaultHome = LoginScreen();

  // Get result of the login function.
  int _userId = await appAuth.startup();
  if (_userId != -1) {
    _defaultHome = const MainScreen();
  }

  runApp(
    BlocProvider(
      create: (context) => BillBloc(),
      child: MyApp(
        defaultHome: _defaultHome,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.defaultHome}) : super(key: key);

  static const appTitle = "Split";
  final Widget defaultHome;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => appTitle,
      home: defaultHome,
      routes: <String, WidgetBuilder>{
        // Set routes for using the Navigator.
        Routes.homeScreenRoute: (BuildContext context) => const MainScreen(),
        Routes.loginScreenRoute: (BuildContext context) => LoginScreen(),
        Routes.billScreenRoute: (BuildContext context) => const BillScreen(),
        Routes.invoiceScreenRoute: (BuildContext context) => const InvoiceScreen(),
      },
    );
  }
}
