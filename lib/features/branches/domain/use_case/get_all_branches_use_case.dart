import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/repo/branches_repo.dart';

class GetAllBranchesUseCase extends UseCase<List<BranchEntity>, NoParams> {
  final BranchRepo repo;

  GetAllBranchesUseCase({required this.repo});
  @override
  Future<List<BranchEntity>> call(NoParams params) async {
    return await repo.getAllBranches();
  }
}

class NoParams {}
