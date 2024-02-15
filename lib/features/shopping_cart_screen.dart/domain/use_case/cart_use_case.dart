import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/repo/cart_repo.dart';

class CartUseCase {
  final CartRepository repo;

  CartUseCase({required this.repo});
  Future<void> addItemUseCase(ItemEntity item) async {
    await repo.addItem(item);
  }

  Future<void> removeItemAtUseCase(int index) async {
    await repo.removeItemAt(index);
  }

  Future<bool> getOrCreateCartUseCase() async {
    return await repo.isCartEmpty();
  }

  Future<List<ItemEntity>> getItemsUseCase() async {
    return await repo.getItems();
  }
}
