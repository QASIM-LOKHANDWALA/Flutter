import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
      ),
      backgroundColor: Colors.blueGrey[100],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.indigo600.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.indigo[600]),
              ),
              onPressed: () {},
              child:
              "Buy".text.color(MyTheme.creamColor).make().onTap(() {
                print("BUY CLICKED");
              }),
            ).wh(100,50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.asset(catalog.image),
            ).h32(context).w56(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyTheme.darkBlue).bold.make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
