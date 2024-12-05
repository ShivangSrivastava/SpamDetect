// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SmsRequest {
  final String body;
  final String sender;

  SmsRequest({
    required this.body,
    required this.sender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'sender': sender,
    };
  }

  factory SmsRequest.fromMap(Map<String, dynamic> map) {
    return SmsRequest(
        body: map['body'] as String, sender: map['sender'] as String);
  }

  String toJson() => json.encode(toMap());

  factory SmsRequest.fromJson(String source) =>
      SmsRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SmsResponse {
  final String body;
  final String sender;
  final bool isSpam;

  SmsResponse({required this.body, required this.sender, this.isSpam = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'sender': sender,
      'isSpam': isSpam,
    };
  }

  factory SmsResponse.fromMap(Map<String, dynamic> map) {
    return SmsResponse(
        body: map['body'] as String,
        sender: map['sender'] as String,
        isSpam: map['isSpam'] == null ? false : map['isSpam'] as bool);
  }

  String toJson() => json.encode(toMap());

  factory SmsResponse.fromJson(String source) =>
      SmsResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
