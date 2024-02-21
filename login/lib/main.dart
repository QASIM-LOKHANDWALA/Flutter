import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/utils/routes.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        MyRoutes.loginRoute : (context) => new LoginPage(),
        MyRoutes.homeRoute : (context) => new HomePage(),
        "/" : (context) => LoginPage(),
      },
    );
  }
}
