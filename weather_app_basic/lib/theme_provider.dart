import 'package:flutter/material.dart';

import 'my_theme.dart';

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
    }else{
      themeData = MyTheme.lightTheme();
    }
  }
}