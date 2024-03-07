import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TopBackgroundWidget extends StatelessWidget {
  const TopBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1,-1.3),
      child: Container(
        height: 300,
        width: 1000,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.colorScheme.primary,
        ),
      ),
    );
  }
}
