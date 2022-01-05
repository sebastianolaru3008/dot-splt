import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split/src/screens/login_screen/login_screen.dart';
import 'package:split/src/screens/main_screen.dart';
import 'package:split/src/services/auth_service.dart';

AuthService appAuth = AuthService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FIXME : remove this after finished login
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('userId');

  // Set default home.
  Widget _defaultHome = LoginScreen();

  // Get result of the login function.
  int _userId = await appAuth.startup();
  if (_userId != -1) {
    _defaultHome = const MainScreen();
  }

  runApp(
    MyApp(
      defaultHome: _defaultHome,
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
        '/home': (BuildContext context) => const MainScreen(),
        '/login': (BuildContext context) => LoginScreen()
      },
    );
  }
}
