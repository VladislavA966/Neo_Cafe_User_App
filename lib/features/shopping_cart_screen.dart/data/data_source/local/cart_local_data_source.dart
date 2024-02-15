import 'package:hive/hive.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/menu_all_item_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/model/cart_model.dart';

abstract class CartLocalDataSource {
  Future<void> addItem(ItemModel item);
  Future<void> removeItemAt(int itemId);
  Future<CartModel> getOrCreateCart();
  Future<List<ItemModel>> getItems();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartModel> cartBox;

  CartLocalDataSourceImpl(this.cartBox);
  @override
  Future<void> addItem(ItemModel item) async {
    final cart = await getOrCreateCart();
    cart.addItem(item);
  }

  @override
  Future<void> removeItemAt(int index) async {
    final cart = await getOrCreateCart();
    if (index >= 0 && index < cart.items.length) {
      cart.items.removeAt(index);
      await cart.save();
    }
  }

  @override
  Future<CartModel> getOrCreateCart() async {
    if (cartBox.isEmpty) {
      final cart = CartModel(items: []);
      await cartBox.add(cart);
      return cart;
    } else {
      return cartBox.values.first;
    }
  }

  @override
  Future<List<ItemModel>> getItems() async {
    final cart = await getOrCreateCart();
    return cart.items;
  }
}
