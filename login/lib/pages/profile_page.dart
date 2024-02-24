import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("PROFILE"),
          backgroundColor: Colors.green[400],
          foregroundColor: Colors.black,
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              //child: Image.asset("images/login.png")
              radius: 140,
              backgroundImage: AssetImage("images/zoro.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
