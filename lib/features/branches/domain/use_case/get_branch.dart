import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/repo/branches_repo.dart';

class BranchUseCase extends UseCase<BranchEntity, BranchParams> {
  final BranchRepo repo;

  BranchUseCase({required this.repo});
  @override
  Future<BranchEntity> call(BranchParams params) async {
    return await repo.getBranch(params.id);
  }
}

class BranchParams {
  final int id;

  BranchParams({required this.id});
}
