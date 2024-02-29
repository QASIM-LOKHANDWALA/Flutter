import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(context.theme.hintColor),
      ),
      onPressed: () {

        if(!isInCart){
          isInCart = !isInCart;
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        }

      },
      child:
      isInCart ? Icon(Icons.done,color: context.theme.canvasColor,) : Icon(CupertinoIcons.cart_badge_plus,color: context.theme.canvasColor,),
    );
  }
}
