import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primaryColor: Colors.teal.shade900,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.teal.shade900,
          onPrimary: Colors.white,
          secondary: Colors.teal.shade500,
          onSecondary: Colors.teal.shade500,
          onError: Colors.black,
          background: Colors.teal.shade300,
          onBackground: Colors.teal.shade300,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red.shade300,
        ),
        backgroundColor: Colors.teal.shade300,
      );
  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
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
