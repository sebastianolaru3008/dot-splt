import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkWrapper {
  NetworkWrapper();

  //TODO define hostname
  static const String hostName = 'dot-splt-api.herokuapp.com';

  static Future<http.Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? requestHeaders,
    Map<String, dynamic>? requestBody,
  }) {
    //TODO verify JWT token before call
    return http.get(
      Uri.http(
        hostName,
        path,
        queryParameters,
      ),
      headers: requestHeaders,
    );
  }

  static Future<http.Response> post(String path, Map<String, dynamic> body,
      {Map<String, dynamic>? queryParameters, Map<String, String>? requestHeaders}) {
    //TODO verify JWT token before call
    return http.post(
      Uri.http(
        hostName,
        path,
        queryParameters,
      ),
      headers: requestHeaders,
      body: jsonEncode(body),
    );
  }
}
