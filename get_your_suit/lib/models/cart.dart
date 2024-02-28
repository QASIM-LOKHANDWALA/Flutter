import 'package:flutter/cupertino.dart';
import 'package:get_your_suit/models/suit.dart';

class Cart extends ChangeNotifier{
  // List of suits for sale
  static List<Suit> suitShop = [
    // TWO PIECE SUITS
    Suit(
      color: "TEAL",
      image: "lib/images/2P_1.webp",
      type: "TWO PIECE SUIT",
      price: "8999",
    ),
    Suit(
      color: "BLUE",
      image: "lib/images/2P_2.webp",
      type: "DOUBLE BREASTED SUIT",
      price: "11099",
    ),
    Suit(
      color: "BEIGE",
      image: "lib/images/2P_3.webp",
      type: "TWO PIECE SUIT",
      price: "9700",
    ),
    // THREE PIECE SUITS
    Suit(
      color: "BLACK",
      image: "lib/images/3P_1.webp",
      type: "TEXTURED THREE PIECE",
      price: "12990",
    ),
    Suit(
      color: "NAVY BLUE",
      image: "lib/images/3P_2.webp",
      type: "THREE PIECE TUXEDO",
      price: "13099",
    ),
    Suit(
      color: "GREY",
      image: "lib/images/3P_3.webp",
      type: "THREE PIECE TUXEDO",
      price: "13099",
    ),
  ];

  // List of items in user's cart
  static List<Suit> userCart =[];

  // Get List of suits for sale
  List<Suit> getSuitList(){
    return suitShop;
  }

  // Get cart
  List<Suit> getUserCart(){
    return userCart;
  }

  // Add items to cart
  void addItemToCart(Suit suit){
    userCart.add(suit);
    notifyListeners();
  }

  // Remove items from cart
  void removeItemFromCart(Suit suit){
    userCart.remove(suit);
    notifyListeners();
  }
}
