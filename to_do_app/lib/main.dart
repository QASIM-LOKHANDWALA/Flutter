import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/util/theme_provider.dart';
import 'package:to_do_app/util/themes.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  // Open A Box
  var box = await Hive.openBox('myBox');
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
