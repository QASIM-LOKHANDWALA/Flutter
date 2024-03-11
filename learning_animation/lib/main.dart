import 'package:flutter/material.dart';
import 'package:learning_animation/implicit_animation/animated_shopping_cart_button.dart';

import 'implicit_animation/animated_color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShoppingCartButton(),
    );
  }
}
