import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme() => ThemeData(
    primaryColor: Colors.teal,
    colorSchemeSeed: Colors.teal[900],
    cardColor: Colors.teal[400],
    canvasColor: Colors.teal[200],
  );
}
