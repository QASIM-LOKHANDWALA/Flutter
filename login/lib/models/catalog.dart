class Item{
  final String id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String imageUrl;

  Item({required this.id,required this.name,required this.desc,required this.color,required this.price,required this.imageUrl});
}

final products = [
  Item(
      id: "001",
      name: "iPhone 12",
      desc: "Apple iPhone 12th Gen",
      color: "#33505a",
      price: 999,
      imageUrl: ""
  ),
];