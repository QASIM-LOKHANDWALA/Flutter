import 'package:flutter/material.dart';
import 'package:login/models/cart.dart';
import 'package:login/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/buy_page.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog))),
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
    return VxBox(
        child: Row(
          children: [
            //Image.asset(catalog.image).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context),
            Hero(
              child: CatalogImage(image: catalog.image),
              tag: Key(catalog.id.toString()),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.theme.focusColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  6.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      _AddToCart( catalog: catalog,),
                    ],
                  ).pOnly(right: 8.0),
                ],
              ),
            ),
          ],
        ),
      ).color(context.cardColor).roundedLg.square(130).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  _AddToCart({
    super.key,
    required this.catalog
  });

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(context.theme.hintColor),
      ),
      onPressed: () {
        isAdded = !isAdded;
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {

        });
      },
      child:
          isAdded ? Icon(Icons.done,color: context.theme.canvasColor,) : "Add To Cart".text.sm.color(MyTheme.creamColor).make(),
    );
  }
}
