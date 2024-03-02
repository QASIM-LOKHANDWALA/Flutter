import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SquareTile extends StatelessWidget {
  final String image;
  final Function()? onTap;
  SquareTile({super.key,required this.image,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          image,
          height: 42,
        ),
      ),
    );
  }
}
