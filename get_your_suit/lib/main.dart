import 'package:flutter/material.dart';
import 'package:get_your_suit/MyRoutes.dart';
import 'package:get_your_suit/models/cart.dart';
import 'package:get_your_suit/pages/home_page.dart';
import 'package:get_your_suit/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        initialRoute: MyRoutes.entryRoute,
        routes: {
          MyRoutes.homeRoute : (context) => const HomePage(),
          MyRoutes.entryRoute : (context) => const IntroPage(),
        },
      ),
    );
  }
}
