import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/suit.dart';

class CartItem extends StatefulWidget {
  Suit suit;
  CartItem({super.key, required this.suit});

  @override
  State<CartItem> createState() => _CartItemState();

}

class _CartItemState extends State<CartItem> {
  // Remove item from cart
  void removeItemFromCart(){
    Provider.of<Cart>(context as BuildContext,listen: false).removeItemFromCart(widget.suit);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        leading: Image.asset(
          widget.suit.image,
        ),
        title: Text(
          widget.suit.type
        ),
        subtitle: Text(
          widget.suit.price
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
