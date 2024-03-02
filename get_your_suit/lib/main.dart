import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_your_suit/MyRoutes.dart';
import 'package:get_your_suit/components/my_drawer.dart';
import 'package:get_your_suit/models/cart.dart';
import 'package:get_your_suit/pages/auth_page.dart';
import 'package:get_your_suit/pages/home_page.dart';
import 'package:get_your_suit/pages/intro_page.dart';
import 'package:get_your_suit/pages/login_or_register_page.dart';
import 'package:get_your_suit/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const AuthPage(),
        //home: LoginPage(),
        //initialRoute: MyRoutes.entryRoute,
        routes: {
          MyRoutes.homeRoute : (context) => HomePage(),
          MyRoutes.entryRoute : (context) => const IntroPage(),
          MyRoutes.loginRoute : (context) => const LoginOrRegisterPage(),
        },
      ),
    );
  }
}
