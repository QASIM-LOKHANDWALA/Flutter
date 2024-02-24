import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7WjONaOfilXR3bebrfe_zcjl58ZdAzJHYw&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blueGrey[700],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: const Size(60, 60),
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                ),
                accountName: Text(LoginPage.name),
                accountEmail: Text(LoginPage.email),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: const Text(
                "P R O F I L E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, MyRoutes.settingRoute);
              },
              leading: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "S E T T I N G ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                print("EMAIL ME CLICKED");
              },
              leading: const Icon(
                Icons.mail,
                color: Colors.white,
              ),
              title: const Text(
                "E M A I L  M E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
