import 'package:flutter/material.dart';
import 'package:get_your_suit/MyRoutes.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "lib/images/logoNoBG.png",
              height: 380,
            ),

            const SizedBox(
              height: 48,
            ),

            // Title
            const Text(
              "BE CLASSY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            // Sub Text
            Text(
              "For every occasion be ready with premium quality suits",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),

            // Next Page Button
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                MyRoutes.homeRoute,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(25),
                child: const Center(
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
