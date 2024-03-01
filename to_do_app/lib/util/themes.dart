import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primaryColor: Colors.teal.shade800,
        canvasColor: Colors.white,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.cyan.shade100,
          onPrimary: Colors.white,
          secondary: Colors.cyan.shade100,
          onSecondary: Colors.cyan.shade500,
          onError: Colors.black,
          background: Colors.teal.shade800,
          onBackground: Colors.cyan.shade300,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red.shade300,
        ),

      );
  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.black,
        //canvasColor: Colors.grey.shade400,
        canvasColor: Colors.black,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black12,
          onSecondary: Colors.black45,
          onError: Colors.black,
          background: Colors.grey.shade900,
          onBackground: Colors.grey.shade400,
          surface: Colors.black,
          onSurface: Colors.white,
          error: Colors.red.shade300,
        ),

      );
}
