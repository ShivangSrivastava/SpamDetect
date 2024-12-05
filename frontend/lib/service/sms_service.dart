import 'package:flutter/services.dart';
import 'package:frontend/models/sms.dart';

class SmsService {
  static const MethodChannel _channel = MethodChannel('com.example.frontend');

  Future<List<SmsRequest>> getAllSms() async {
    try {
      final List<dynamic>? result = await _channel.invokeMethod('getAllSms');
      return result
              ?.map((sms) => SmsRequest.fromMap(Map<String, dynamic>.from(sms)))
              .toList() ??
          [];
    } on PlatformException {
      return [];
    }
  }
}
