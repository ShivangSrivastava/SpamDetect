// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/models/sms.dart';

class PreviewMessage extends StatelessWidget {
  final SmsResponse smsResponse;
  const PreviewMessage({
    super.key,
    required this.smsResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(smsResponse.sender),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              decoration: ShapeDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: (smsResponse.isSpam) ? Colors.red : Colors.green,
                      spreadRadius: 5,
                      blurRadius: 20,
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(smsResponse.body),
              ),
            ),
          )
        ],
      ),
    );
  }
}
