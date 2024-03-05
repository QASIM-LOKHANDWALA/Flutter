import 'package:flutter/material.dart';

class Widget2 extends StatelessWidget {
  const Widget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-4,-0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple.shade500,
        ),
      ),
    );
  }
}
