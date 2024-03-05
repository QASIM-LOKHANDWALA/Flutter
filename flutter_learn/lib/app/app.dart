import 'package:flutter/material.dart';
import 'package:flutter_learn/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FLUTTER',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeView(),
    );
  }
}