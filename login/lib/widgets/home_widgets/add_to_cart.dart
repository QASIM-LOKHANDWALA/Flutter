import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(context.theme.hintColor),
      ),
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      child:
      isInCart ? Icon(Icons.done,color: context.theme.canvasColor,) : Icon(CupertinoIcons.cart_badge_plus,color: context.theme.canvasColor,),
    );
  }
}
