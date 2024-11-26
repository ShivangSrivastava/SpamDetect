import 'package:flutter/material.dart';
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpamDetect',
      theme: isDark ? FlutterFlowTheme.darkTheme : FlutterFlowTheme.lightTheme,
      home: HomePageWidget(
        isDark: false,
        changeTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}
