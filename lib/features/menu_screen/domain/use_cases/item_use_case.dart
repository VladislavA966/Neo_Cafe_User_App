import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/repo/category_repo.dart';

class ItemUseCase extends UseCase<ItemEntity, ItemParams> {
  final MenuRepo repo;

  ItemUseCase({required this.repo});
  @override
  Future<ItemEntity> call(ItemParams params) async {
    return await repo.getItem(params.id);
  }
}

class ItemParams {
  final int id;

  ItemParams({required this.id});
}
