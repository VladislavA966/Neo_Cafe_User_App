import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';

abstract class BranchRepo {
  Future<List<BranchEntity>> getAllBranches();
  Future<BranchEntity> getBranch(int id);
  Future<List<ItemEntity>> getBranchFavouriteItems();
}
