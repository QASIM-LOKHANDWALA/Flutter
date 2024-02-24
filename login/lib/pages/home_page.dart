import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CATALOG"),
      ),
      body: Center(
        child: Container(
          child: Text("WELCOME"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}