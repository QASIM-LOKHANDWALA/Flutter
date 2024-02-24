class CatalogModel{
  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 12",
        desc: "Apple iPhone 12th Gen",
        color: "#33505a",
        price: 999,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc"
    ),
    Item(
        id: 2,
        name: "Pixel 5",
        desc: "Google Pixel phone 5th generation",
        price: 699,
        color: "#00ac51",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd0JhwLvm_uLDLc-la7hK9WyVpe9naJFcebKfhcICiq2KtvXDePNAU_9QO06LPcQ0K0fLByc7m&usqp=CAc"
    ),
    Item(
        id: 3,
        name: "M1 Macbook Air",
        desc: "Apple Macbook air with apple silicon",
        price: 1099,
        color: "#e0bfae",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMOMstwtmLnjFb3NHiDJ_kcQnueNVH-rv_3ps96HZmXlFumKWaiBqq_L4Uoyx3iFiNTrXNEbyB&usqp=CAc"
    ),
    Item(
        id: 4,
        name: "Playstation 5",
        desc: "Sony Playstation 5th generation",
        price: 500,
        color: "#544ee4",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMOMstwtmLnjFb3NHiDJ_kcQnueNVH-rv_3ps96HZmXlFumKWaiBqq_L4Uoyx3iFiNTrXNEbyB&usqp=CAc"
    ),
    Item(
        id: 5,
        name: "Airpods Pro",
        desc: "Apple Aipods Pro 1st generation",
        price: 200,
        color: "#e3e4e9",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQROEs084z65psoo06zYl5R0tUzywOVKVQZzmzqCj3PDP1vVJTWv3gGwGMFENSy4qV4n7sEQjE&usqp=CAc"
    ),
    Item(
        id: 6,
        name: "iPad Pro",
        desc: "Apple iPad Pro 2020 edition",
        price: 799,
        color: "#f73984",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNzUeRQ5uH7E3hpECib8qxdhfHv6SnUGT7mOsew_xiOoqRR7ZpdH-TQ4J6-HuIEfqHimYyPXWH&usqp=CAc"
    ),
    Item(
        id: 7,
        name: "Galaxy S21 Ultra",
        desc: "Samsung Galaxy S21 Ultra 2021 edition",
        price: 1299,
        color: "#1c1c1c",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT_PZcc0wicVYR992s5QCIDLYy8t-z-9kibTUdWZBN2sd86aaqdAJfhvxAwZNWV9wfdzDikpr1&usqp=CAc"
    ),
    Item(
        id: 8,
        name: "Galaxy S21",
        desc: "Samsung Galaxy S21 2021 edition",
        price: 899,
        color: "#7c95eb",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNHd7FwarbxA1xdMFt24KazjcR4dWPH_t_T5dz4YNK1s7rJAQ8gOIuR_NRw6eeiQgFhbZ9sAN&usqp=CAc"
    )
  ];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String image;

  Item({required this.id,required this.name,required this.desc,required this.color,required this.price,required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"]
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image
  };
}

