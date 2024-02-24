import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';

abstract class BranchRepo {
  Future<List<BranchEntity>> getAllBranches();
  Future<BranchEntity> getBranch(int id);
}
