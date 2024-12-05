import 'dart:convert';

import 'package:frontend/models/sms.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String ipAdress;
  late final String baseUrl;
  ApiServices({required this.ipAdress}) {
    baseUrl = "http://$ipAdress:8000/api/check";
  }
  Future<SmsResponse> checkIsSpam(SmsRequest sms) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"text": sms.body}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      String result = jsonResponse["result"] ?? "unknown";

      return SmsResponse(
        body: sms.body,
        sender: sms.sender,
        isSpam: result == "spam",
      );
    } else {
      throw Exception(
          "Failed to process SMS. Status code: ${response.statusCode}");
    }
  }
}
