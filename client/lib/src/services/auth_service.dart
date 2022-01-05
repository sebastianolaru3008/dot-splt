import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:split/src/data/network_wrapper/network_wrapper.dart';

class AuthService {
  // Login
  Future<int> startup() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId') ?? -1;
    // Simulate a future for response after 2 second.
    return userId;
  }

  Future<int> login(String name) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> loginRequestBody = {};
    loginRequestBody['name'] = name;

    final response =
        await NetworkWrapper.post('/v1/authenticate', loginRequestBody);
    final loginResponse = jsonDecode(response.body);
    print(loginResponse);
    prefs.setInt('userId', loginResponse['user_id']);

    // Simulate a future for response after 2 second.
    return loginResponse['user_id'];
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    // Simulate a future for response after 1 second.
    return await Future<void>.delayed(const Duration(seconds: 1));
  }
}
