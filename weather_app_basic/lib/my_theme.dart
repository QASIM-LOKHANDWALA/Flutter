import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme() => ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xff00afb9),
      onPrimary: const Color(0xff00afb9),
      secondary: const Color(0xff73fa7a),
      onSecondary: const Color(0xff73fa7a),
      error: Colors.red,
      onError: Colors.red,
      background: Colors.grey.shade300,
      onBackground: Colors.grey.shade300,
      surface: Colors.grey.shade300,
      onSurface: Colors.black12,
    ),
    focusColor: Colors.black,
  );
  static ThemeData darkTheme() => ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xffc33764),
      onPrimary:const Color(0xffc33764),
      secondary: const Color(0xff1d2671),
      onSecondary: const Color(0xff1d2671),
      error: Colors.red,
      onError: Colors.red,
      background: Colors.black,
      onBackground: Colors.black,
      surface: Colors.grey.shade600,
      onSurface: Colors.grey.shade600,
    ),
    focusColor: Colors.white,
  );
}