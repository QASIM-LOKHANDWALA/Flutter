import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/utils/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String email = "";
  static String name = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
      // Navigator.pop(context);
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Welcome ${LoginPage.name}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          LoginPage.name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter E-mail",
                          labelText: "e-mail",
                        ),
                        validator: (value) {
                          if (!EmailValidator.validate(value!)) {
                            return "Invalid Email";
                          }
                          LoginPage.email = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password should be at least 6 character long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Material(
                        color: context.theme.hintColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
