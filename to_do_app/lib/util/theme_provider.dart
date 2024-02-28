import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/util/themes.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = MyTheme.lightTheme();
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == MyTheme.lightTheme()){
      themeData = MyTheme.darkTheme();
      HomePage.themeIcon = Icon(Icons.sunny);
    }else{
      themeData = MyTheme.lightTheme();
      HomePage.themeIcon = Icon(Icons.nightlight);
    }
  }
}