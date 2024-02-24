import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/profile_page.dart';
import 'package:login/pages/setting_page.dart';
import 'package:login/utils/routes.dart';
import 'package:login/widgets/themes.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute : (context) => const LoginPage(),
        MyRoutes.homeRoute : (context) => const HomePage(),
        MyRoutes.settingRoute : (context) => const settingsPage(),
        MyRoutes.profileRoute : (context) => const ProfilePage(),
        "/" : (context) => const LoginPage(),
      },
    );
  }
}
