import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://covid19.mathdro.id/api";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final fullUrl = baseUrl + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");

    final response = await http.get(fullUrl);

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body ?? "";
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      return {"error": true};
    }
  }
}
