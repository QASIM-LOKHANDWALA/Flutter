import 'package:flutter/material.dart';

// main function is a starting point for all Flutter apps.
void main() {
  runApp(
      MaterialApp(
        home:Scaffold(
          backgroundColor: Colors.deepPurple[100],
          appBar: AppBar(
            title: const Text('I am Rich'),
            backgroundColor: Colors.deepPurple[600],
            foregroundColor: Colors.white70,
          ),
          body: const Center(
            child: Text('RICH'),
          ),
        ),
      )
  );
}
