import 'package:login/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // Catalog Field
  late CatalogModel _catalog;
  // Ids of items added in cart
  final List<int> _itemIds =[];
  // Get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }
  // Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  // Get total price
  num get totalPrice => items.fold(0, (total, element) => total+element.price);
  // Add items
  void add(Item item){
    _itemIds.add(item.id);
  }
  // Remove items
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}