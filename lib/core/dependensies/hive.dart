import 'package:hive_flutter/hive_flutter.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/menu_all_item_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/model/cart_model.dart';

class HiveSetup {
  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(CartModelAdapter());

    await Hive.openBox<ItemModel>('itemModels');
    await Hive.openBox<CartModel>('cartModels');
  }
}
