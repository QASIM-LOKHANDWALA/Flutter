import 'package:flutter/material.dart';
import 'package:login/pages/buy_page.dart';
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
        forceMaterialTransparency: true,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.indigo600.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.hintColor),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuyPage(catalog)));
              },
              child: "Buy".text.color(MyTheme.creamColor).make(),
            ).wh(100, 50),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.theme.focusColor).bold.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue maximus ipsum vitae rhoncus. Ut eleifend eros quis suscipit commodo. In hac habitasse platea dictumst. Vestibulum sit amet nisl ac lorem ultrices aliquam. Maecenas mattis quam in lacus pretium, ac laoreet lectus varius. Nunc eu justo venenatis, sagittis metus tincidunt."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p20(),
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
