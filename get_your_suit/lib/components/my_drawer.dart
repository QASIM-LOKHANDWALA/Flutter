import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_your_suit/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(context, MyRoutes.loginRoute, (route) => false);
      print('Successfully signed out');
    } on FirebaseAuthException catch (e) {
      print('Error signing out: ${e.code}');
      // Handle specific errors if needed
    }
  }

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
            padding: const EdgeInsets.all(25),
            child: GestureDetector(
              onTap: signOut,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.logout,color: Colors.black,),
                    "L O G  O U T".text.color(Colors.black).make(),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
