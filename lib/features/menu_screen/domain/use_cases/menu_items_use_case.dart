import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/repo/category_repo.dart';

class AllItemsUseCase extends UseCase<List<ItemEntity>, NoParams> {
  final MenuRepo repo;

  AllItemsUseCase({required this.repo});
  @override
  Future<List<ItemEntity>> call(NoParams params) async {
    return await repo.getAllMenuItems();
  }
}

class NoParams {}
