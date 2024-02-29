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
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Container(
        height: 180,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  widget.suit.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.suit.type,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                        Text(
                          "Rs. ${widget.suit.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: removeItemFromCart,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical:10.0),
                            child: Text(
                              "REMOVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // IconButton(
            //   icon: Icon(Icons.delete),
            //   onPressed: removeItemFromCart,
            // ),
          ],
        ),
        // leading: Image.asset(
        //   widget.suit.image,
        // ),
        // title: Text(
        //     widget.suit.type
        // ),
        // subtitle: Text(
        //     widget.suit.price
        // ),
        // trailing: IconButton(
        //   icon: Icon(Icons.delete),
        //   onPressed: removeItemFromCart,
        // ),
      ),
    );
  }
}
