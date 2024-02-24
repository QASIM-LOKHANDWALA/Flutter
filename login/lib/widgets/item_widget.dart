import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaler: const TextScaler.linear(1.3),
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
