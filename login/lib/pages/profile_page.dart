import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: context.canvasColor,
          title: "PROFILE".text.bold.xl3.color(context.theme.focusColor).make(),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              //child: Image.asset("images/login.png")
              radius: 140,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.refresh_thick,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "CHANGE NAME",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      print("CHANGE NAME CLICKED");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "UPDATE EMAIL",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      print("UPDATE EMAIL CLICKED");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      LoginPage.name = "";
                      Navigator.pushNamedAndRemoveUntil(context, MyRoutes.loginRoute, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
