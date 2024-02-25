import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String result = "";
  bool loading = false;
  getResponse() async {
    http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/check"),
      headers: {"Content-Type": "application/json"},
      body: '{"text": "${controller.text}"}',
    );
    Future.delayed(const Duration(seconds: 1), () {
      if (response.statusCode == 200) {
        result = jsonDecode(response.body)['result'];
        loading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpamDetect"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result.toUpperCase(),
                  textScaler: const TextScaler.linear(2.5),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (result.toLowerCase() == "spam")
                        ? Colors.redAccent
                        : Colors.green,
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: controller,
              style: const TextStyle(
                letterSpacing: 1,
                wordSpacing: 2,
              ),
              decoration: const InputDecoration(
                hintText: "Enter your message here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              maxLines: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                loading = true;
                setState(() {});
                getResponse();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
              child: Visibility(
                visible: !loading,
                replacement: const CircularProgressIndicator(),
                child: const Text("Check"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
