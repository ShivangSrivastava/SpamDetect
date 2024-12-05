import 'package:flutter/material.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  runApp(const MyApp());
  await [
    Permission.sms,
  ].request();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sms Spam Filtering',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          brightness: Brightness.dark),
      themeMode: (isDark == true) ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDark: isDark,
        changeTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}
