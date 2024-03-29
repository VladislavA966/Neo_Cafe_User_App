import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/repo/branches_repo.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';

class GetFavouriteItemsUseCase extends UseCase<List<ItemEntity>, void> {
  final BranchRepo repo;

  GetFavouriteItemsUseCase({required this.repo});
  @override
  Future<List<ItemEntity>> call(void params) async {
    return await repo.getBranchFavouriteItems();
  }
}
