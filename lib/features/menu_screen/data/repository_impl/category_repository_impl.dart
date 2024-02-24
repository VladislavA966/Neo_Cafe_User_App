import 'package:neo_cafe_24/features/menu_screen/data/data_source/menu_remote_data_dource.dart';
import 'package:neo_cafe_24/features/menu_screen/data/mapper/menu_item_mapper.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/category_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/repo/category_repo.dart';

class MenuRepositoryImpl implements MenuRepo {
  final MenuRemoteImpl remote;

  MenuRepositoryImpl({required this.remote});
  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final remoteCategories = await remote.getAllCategories();
    final List<CategoryEntity> categoryEntities =
        remoteCategories.map((model) => model.toEntity()).toList();
    return categoryEntities;
  }

  @override
  Future<List<ItemEntity>> getAllMenuItems() async {
    final remoteItems = await remote.getAllItems();
    final itemsEntity = remoteItems.map((model) => model.toDomain()).toList();
    return itemsEntity;
  }

  @override
  Future<ItemEntity> getItem(int id) async {
    final remoteItem = await remote.getItem(id);
    return remoteItem.toDomain();
  }
}
