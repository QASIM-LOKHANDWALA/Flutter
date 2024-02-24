import 'package:flutter/material.dart';
import 'package:login/widgets/themes.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyTheme.defaultAppBar("CATALOG"),
      body: const Center(
        child: Text("WELCOME"),
      ),
      drawer: const MyDrawer(),
    );
  }
}