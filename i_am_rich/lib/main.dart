import 'package:flutter/material.dart';

// main function is a starting point for all Flutter apps.
void main() {
  runApp(
      MaterialApp(
        home:Scaffold(
          backgroundColor: Colors.blueGrey[400],
          appBar: AppBar(
            title: const Text('I am Rich'),
            backgroundColor: Colors.blueGrey[900],
            foregroundColor: Colors.white70,
          ),
          body: const Center(
            child: Image(
                image: AssetImage('images/diamond.png'),
            )
          ),
        ),
      )
  );
}
