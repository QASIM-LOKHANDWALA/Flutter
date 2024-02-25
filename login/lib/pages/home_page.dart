import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext get context => this.context;

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
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: "WELCOME".text.xl4.bold.color(Colors.blueGrey[800]).make(),
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
        // GestureDetector(
        //     child: const Icon(
        //       Icons.menu_rounded,
        //       size: 30,
        //       color: Color(0xff403b58),
        //     ),
        //     onTap: () {
        //       try {
        //         _HomePageState._scaffoldKey.currentState?.openDrawer();
        //         print("menu");
        //       } catch (e) {
        //         print("Error opening drawer: $e");
        //       }
        //     },
        // ),
        // const SizedBox(
        //   width: 20,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "ELECTRONICS".text.xl4.bold.color(MyTheme.darkBlue).make(),
            "Trending Products".text.xl2.make(),
          ],
        ),
      ],
    );
  }
}