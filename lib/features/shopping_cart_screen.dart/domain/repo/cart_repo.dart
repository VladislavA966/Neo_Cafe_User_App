import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';

abstract class CartRepository {
  Future<void> addItem(ItemEntity item);
  Future<void> removeItemAt(int index);
  Future<bool> isCartEmpty();
  Future<List<ItemEntity>> getItems();
}
