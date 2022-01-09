import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split/src/data/network_wrapper/network_wrapper.dart';
import 'package:split/src/models/bill/bill_json.dart';
import 'package:split/src/models/product/product_json.dart';
import 'package:split/src/models/receipt/receipt_json.dart';

class BillingService {
  static Future<Bill> requestBillProducts({required String token}) async {
    Map<String, dynamic> getBillRequestBody = {"bill_id": token};

    final response = await NetworkWrapper.get(
      '/v1/getbill',
      queryParameters: getBillRequestBody,
    );

    final Bill getBillResponse = Bill.fromJson(json.decode(response.body) as Map<String, dynamic>);
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    return getBillResponse;
  }

  static Future<Receipt> sendBillWithUserId({required String token, required List<Product> products}) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> sendRecieptRequestBody = {
      "bill_id": token,
      "user_id": prefs.getInt("user_id"),
      "products": products,
    };

    print("Request : ${sendRecieptRequestBody}");

    final response = await NetworkWrapper.post('/v1/editbill', sendRecieptRequestBody);

    final Receipt sendRecieptResponse = Receipt.fromJson(json.decode(response.body) as Map<String, dynamic>);

    print("Response : ${sendRecieptResponse}");

    // Simulate a future for response after 2 second.
    return sendRecieptResponse;
  }

  static Future<Bill> requestBillByImage(ImageSource source) async {
    final prefs = await SharedPreferences.getInstance();
    final image = await ImagePicker().pickImage(source: source);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://dot-splt-api.herokuapp.com/v1/upload"),
    );
    Map<String, String> headers = {"Content-encoding": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'bill',
        image!.readAsBytes().asStream(),
        await image.length(),
        filename: "filename",
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({"author": prefs.getInt("user_id").toString()});
    print("starting the request");
    final response = await request.send();
    final responseStr = await response.stream.bytesToString();
    print("Response : ${responseStr}");

    final Bill getBillResponse = Bill.fromJson(json.decode(responseStr) as Map<String, dynamic>);

    return getBillResponse;
  }
}
