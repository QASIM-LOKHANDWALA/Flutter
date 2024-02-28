import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Image.asset(
                  "lib/images/logoNoBG.png",
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Other Pages
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: "H o m e".text.color(Colors.white).make(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: "A b o u t".text.color(Colors.white).make(),
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: "L o g  O u t".text.color(Colors.white).make(),
            ),
          ),

        ],
      ),
    );
  }
}
