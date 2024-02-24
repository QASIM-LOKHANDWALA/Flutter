import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SETTING"),
          backgroundColor: Colors.green[400],
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
