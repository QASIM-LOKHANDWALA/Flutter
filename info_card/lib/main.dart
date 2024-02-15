import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'qasim lokhandwala',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ENGINEER',
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 2.5,
                  fontFamily: 'Oswald',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white30,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                    title: Text(
                      '+91 9876543210',
                      style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Oswald',
                          fontSize: 20.0
                      )
                    ),
                  )
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                        'qasim@gmail.com',
                        style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Oswald',
                            fontSize: 20.0
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
