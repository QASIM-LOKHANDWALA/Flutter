import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const primaryColor = '0xFF33505a';
  static AppBar defaultAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xFF33505a),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}
