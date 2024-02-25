import 'package:flutter/material.dart';
import 'package:frontend/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpamDetect',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
