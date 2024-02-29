import 'package:flutter/material.dart';
import 'package:login/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "CART".text.color(context.theme.focusColor).bold.xl3.make(),
        backgroundColor: context.canvasColor,
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(),
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({super.key});

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(context.theme.focusColor).make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.primaryColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying Not Yet Supported".text.make()));
            },
            child: "Buy".text.color(context.theme.appBarTheme.backgroundColor).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: (){},
        ),
        title: _cart.items[index].name.text.make(),
      ) ,
    );
  }
}
