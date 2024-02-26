import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/themes.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: context.canvasColor,
          title: "SETTINGS".text.bold.xl3.color(context.theme.focusColor).make(),
        ),
      ),
    );
  }
}
