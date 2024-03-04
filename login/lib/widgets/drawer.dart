import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/utils/routes.dart';
import 'package:login/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7WjONaOfilXR3bebrfe_zcjl58ZdAzJHYw&usqp=CAU";
    return Drawer(
      child: Container(
        color: context.cardColor,
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
                  color: context.theme.focusColor,
                ),
                accountName: Text(LoginPage.name,style: TextStyle(color: context.theme.cardColor),),
                accountEmail: Text(LoginPage.email,style: TextStyle(color: context.theme.cardColor),),
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
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.theme.focusColor,
              ),
              title: Text(
                "P R O F I L E",
                style: TextStyle(
                  color: context.theme.focusColor,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, MyRoutes.settingRoute);
              },
              leading: Icon(
                CupertinoIcons.settings,
                color: context.theme.focusColor,
              ),
              title: Text(
                "S E T T I N G ",
                style: TextStyle(
                  color: context.theme.focusColor,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                print("EMAIL ME CLICKED");
              },
              leading: Icon(
                Icons.mail,
                color: context.theme.focusColor,
              ),
              title: Text(
                "E M A I L  M E",
                style: TextStyle(
                  color: context.theme.focusColor,
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
