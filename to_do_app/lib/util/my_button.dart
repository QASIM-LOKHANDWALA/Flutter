import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onPressed});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: context.primaryColor,
      child: Text(text,style: TextStyle(color: context.theme.colorScheme.onPrimary),),
    );
  }
}
