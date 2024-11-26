import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  FlutterFlowTheme._();

  // Light theme definitions
  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.interTight().fontFamily,
    brightness: Brightness.light,
    primaryColor: const Color(0xff673ab7),
    dialogBackgroundColor: const Color(0xffffffff),
    scaffoldBackgroundColor: const Color(0xfff1f4f8),
    dividerColor: const Color(0xff14181b),
    canvasColor: const Color(0xffe0e3e7),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );

  // Dark theme definitions
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff4b39ef),
    dialogBackgroundColor: const Color(0xff14181b),
    scaffoldBackgroundColor: const Color(0xff1d2428),
    dividerColor: const Color(0xffffffff),
    canvasColor: const Color(0xff262d34),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );

  // Access current theme dynamically
  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }
}
