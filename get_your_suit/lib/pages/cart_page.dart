import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/suit.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context,value,child) => Column(
          children: [
            // Heading
            "MY CART".text.bold.xl.make(),
            const SizedBox(height: 20,),
            // Items in cart
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context,index) {
                  Suit s = value.getUserCart()[index];

                  return CartItem(suit: s,);
                },
              ),
            ),
          ],
        ),
    );
  }
}
