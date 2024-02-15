import 'package:neo_cafe_24/features/menu_screen/data/models/menu_all_item_model.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/data_source/local/cart_local_data_source.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/repo/cart_repo.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource dataSource;

  CartRepositoryImpl({required this.dataSource});

  @override
  Future<void> addItem(ItemEntity item) async {
    final itemModel = ItemModel(
      id: item.id,
      name: item.name,
      description: item.description,
      category: item.category,
      itemImage: item.itemImage,
      type: item.type,
      pricePerUnit: item.pricePerUnit,
      branch: item.branch,
    );
    await dataSource.addItem(itemModel);
  }

  @override
  Future<void> removeItemAt(int index) async {
    await dataSource.removeItemAt(index);
  }

  @override
  Future<List<ItemEntity>> getItems() async {
    final itemsModel = await dataSource.getItems();

    return itemsModel
        .map((item) => ItemEntity(
              id: item.id ?? 0,
              name: item.name ?? '',
              description: item.description ?? '',
              category: item.category ?? 0,
              itemImage: item.itemImage ?? '',
              type: item.type ?? '',
              pricePerUnit: item.pricePerUnit ?? 0,
              branch: item.branch ?? 0,
            ))
        .toList();
  }

  @override
  Future<bool> isCartEmpty() async {
    final cart = await dataSource.getOrCreateCart();
    return cart.items.isEmpty;
  }
}
