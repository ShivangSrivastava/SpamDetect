// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/models/sms.dart';
import 'package:frontend/service/api_services.dart';

class CheckPage extends StatefulWidget {
  final String ipAdress;
  const CheckPage({
    super.key,
    required this.ipAdress,
  });

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final TextEditingController _controller = TextEditingController();

  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text your message"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                if (value.isEmpty) {
                  result = "";
                  setState(() {});
                }
              },
              controller: _controller,
              minLines: 5,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your message...",
              ),
            ),
            const SizedBox(height: 20),
            (result.isNotEmpty)
                ? Text(
                    result,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: (result == "Spam")
                            ? Colors.redAccent
                            : Colors.green),
                  )
                : Container(),
            const SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  SmsResponse response =
                      await ApiServices(ipAdress: widget.ipAdress).checkIsSpam(
                          SmsRequest(body: _controller.text, sender: "4443"));
                  if (response.isSpam) {
                    result = "Spam";
                  } else {
                    result = "Unsure/Ham";
                  }
                  setState(() {});
                }
              },
              child: const Text("Check"),
            ),
          ],
        ),
      ),
    );
  }
}
