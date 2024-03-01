import 'package:flutter/material.dart';
import 'package:get_your_suit/models/suit.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/product_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add suit to cart method
  void addSuitToCart(Suit suit) {
    print("tapped");
    Provider.of<Cart>(context, listen: false).addItemToCart(suit);
    // Alert user that item has been added successfully
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text(
                "ADDED SUCCESSFULLY!",
                style: TextStyle(color: Colors.white),
              ),
              content: const Text(
                "Check Your cart",
                style: TextStyle(color: Colors.white),
              ),
            ));
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 6),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: myController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.grey.shade700,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade700,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: "Why Be Normal.... Stay Stylish"
                .text
                .semiBold
                .lg
                .color(Colors.grey[800])
                .make(),
          ),

          // Hot Picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                "Hot Picks".text.xl3.bold.make(),
                "see all".text.lg.color(Colors.blue.shade600).make(),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: Cart.suitShop.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Suit suit = value.getSuitList()[index];
                return ProductTile(
                  suit: suit,
                  myOnTap: () => addSuitToCart(suit),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
