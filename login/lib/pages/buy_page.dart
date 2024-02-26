import 'package:flutter/material.dart';
import 'package:login/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class BuyPage extends StatelessWidget {
  const BuyPage(this.catalog, {super.key});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: MyTheme.defaultAppBar("ORDER DETAILS"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: "PRODUCT CHOSEN".text.bold.xl3.color(Colors.black).make(),
            ),
            ProductCard(catalog: catalog),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: context.screenWidth,
              height: 1,
              color: MyTheme.darkBlue,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: "PAYMENT METHOD".text.bold.xl3.color(Colors.black).make(),
            ),
            PaymentOptions().p32()
          ],
        ),
      ),
    );
  }
}

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5.0),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color(0xFF33505a)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.paypal_outlined),
                const SizedBox(width: 8,),
                "UPI".text.xl.semiBold.make(),
              ],
            ),
          ).w64(context).h8(context).py8(),
          ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5.0),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color(0xFF33505a)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.credit_card),
                const SizedBox(width: 8,),
                "CARD".text.xl.semiBold.make(),
              ],
            ),
          ).w64(context).h8(context).py8(),
          ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5.0),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color(0xFF33505a)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.payments_sharp),
                const SizedBox(width: 8,),
                "CASH".text.xl.semiBold.make(),
              ],
            ),
          ).w64(context).h8(context).py8(),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {

  const ProductCard({
    super.key,
    required this.catalog,
  });

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset(
                catalog.image,
                width: context.screenWidth * 0.4,
                height: context.screenWidth * 0.4,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name.text.xl.bold.make(),
              "\$${catalog.price}".text.xl.bold.make(),
              "Delivery Charge\n\$25"
                  .text
                  .lg
                  .semiBold
                  .color(MyTheme.darkBlue)
                  .make(),
              Container(
                width: context.screenWidth*0.35,
                height: 1,
                color: MyTheme.darkBlue,
              ),
              "Subtotal : \$${catalog.price + 25}"
                  .text
                  .lg
                  .semiBold
                  .color(MyTheme.darkBlue)
                  .make(),
            ],
          )
        ],
      ),
    );
  }
}
