import 'package:flutter/material.dart';
import 'package:login/core/store.dart';
import 'package:login/pages/cart_page.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/profile_page.dart';
import 'package:login/pages/setting_page.dart';
import 'package:login/utils/routes.dart';
import 'package:login/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main(){
  runApp(
    VxState(
      store: MyStore(),
      child: const MyApp(),
    )
  );
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
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute : (context) => const LoginPage(),
        MyRoutes.homeRoute : (context) =>  const HomePage(),
        MyRoutes.settingRoute : (context) => const settingsPage(),
        MyRoutes.cartRoute : (context) => const CartPage(),
        MyRoutes.profileRoute : (context) => const ProfilePage(),
        "/" : (context) => const LoginPage(),
      },
    );
  }
}
