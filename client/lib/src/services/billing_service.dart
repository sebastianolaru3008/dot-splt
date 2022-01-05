import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:split/src/data/network_wrapper/network_wrapper.dart';
import 'package:split/src/models/bill/bill_json.dart';

class BillingService {
  static Future<Bill> getBillByToken(String token) async {
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
}
