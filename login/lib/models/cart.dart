import 'package:login/core/store.dart';
import 'package:login/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

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

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
    throw UnimplementedError();
  }

}