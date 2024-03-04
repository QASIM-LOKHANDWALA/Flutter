import 'package:flutter/material.dart';
import 'package:login/models/cart.dart';
import 'package:login/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/buy_page.dart';
import '../themes.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 30),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailPage(catalog: catalog))),
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailPage(catalog: catalog))),
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        child: CatalogImage(image: catalog.image),
        tag: Key(catalog.id.toString()),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.theme.highlightColor).bold.make(),
              catalog.desc.text.color(context.theme.highlightColor).textStyle(context.captionStyle).make(),
              6.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.color(context.theme.highlightColor).bold.xl.make(),
                  AddToCart( catalog: catalog,),
                ],
              ).pOnly(right: 8.0),
            ],
          ),
        ).p(context.isMobile ? 0 : 20),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
        children: children2,
      )
          : Column(
        children: children2,
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
