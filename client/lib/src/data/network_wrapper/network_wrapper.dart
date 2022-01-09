import 'package:http/http.dart';

class NetworkWrapper {
  NetworkWrapper(this._client);

  final Client _client;

  //TODO define hostname
  static const String hostName = '';

  //TODO create authorization header
  final Map<String, String>? headers = {};

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    //TODO verify JWT token before call
    return _client.get(
      Uri.http(hostName, path, queryParameters),
      headers: headers,
    );
  }
}
