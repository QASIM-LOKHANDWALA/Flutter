import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/models/catalog.dart';
import 'package:login/widgets/themes.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final CatalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(CatalogJson);
    final productsData = decodedData("products");
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => item.fromMap(item))
        .toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTheme.defaultAppBar("CATALOG"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index], key: null,
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
