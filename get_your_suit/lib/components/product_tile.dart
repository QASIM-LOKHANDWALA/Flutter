import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/suit.dart';

class ProductTile extends StatelessWidget {
  Suit suit;
  void Function()? myOnTap;
  ProductTile({super.key, required this.suit,required this.myOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                suit.image,
                height: 240,
              ),
            ),
          ),

          // Type
          Text(
            suit.type,
            style: TextStyle(color: Colors.grey[800]),
          ),

          // Price
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suit.color,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rs. ' + suit.price,
                      style: TextStyle(
                          color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),

                // Buttons
                GestureDetector(
                  onTap: myOnTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
