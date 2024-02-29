import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primaryColor: Colors.cyan.shade700,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.cyan.shade700,
          onPrimary: Colors.white,
          secondary: Colors.cyan.shade300,
          onSecondary: Colors.cyan.shade500,
          onError: Colors.black,
          background: Colors.cyan.shade100,
          onBackground: Colors.cyan.shade300,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red.shade300,
        ),
        backgroundColor: Colors.cyan.shade100,
      );
  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black45,
          onSecondary: Colors.black45,
          onError: Colors.black,
          background: Colors.grey.shade900,
          onBackground: Colors.grey.shade400,
          surface: Colors.black,
          onSurface: Colors.white,
          error: Colors.red.shade300,
        ),
        backgroundColor: Colors.grey.shade400,
      );
}
