import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/utils/routes.dart';
import 'package:login/widgets/drawer.dart';
import 'dart:convert';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  BuildContext get context => _HomePageState().context;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: context.theme.primaryColor,
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        //title: "WELCOME".text.xl4.bold.color(context.theme.focusColor).make(),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "ELECTRONICS".text.xl4.bold.color(context.theme.focusColor).make(),
            "Trending Products".text.color(context.theme.focusColor).xl2.make(),
          ],
        ),
      ],
    );
  }
}