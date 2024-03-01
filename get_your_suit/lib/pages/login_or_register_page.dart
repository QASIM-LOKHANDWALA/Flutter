import 'package:flutter/material.dart';
import 'package:get_your_suit/pages/login_page.dart';
import 'package:get_your_suit/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void toggle(){
    setState(() {
      showLoginPage =! showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: toggle,
      );
    }else{
      return RegisterPage(
        onTap: toggle,
      );
    }
  }
}
