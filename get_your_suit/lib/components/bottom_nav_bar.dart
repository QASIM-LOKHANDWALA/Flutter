import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[600],
        activeColor: Colors.grey.shade800,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.white,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(icon: Icons.home,text: "Shop",),
          GButton(icon: Icons.shopping_cart,text: "Cart",),
        ],
      ),
    );
  }
}
