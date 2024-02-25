import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: context.percentWidth * 25,
        height: context.percentWidth * 25,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
  }
}
