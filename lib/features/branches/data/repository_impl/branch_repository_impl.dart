import 'package:neo_cafe_24/features/branches/data/data_source/remote/branch_remote_data_source.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/branch_mapper.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/repo/branches_repo.dart';

class BranchRepositoryImpl implements BranchRepo {
  final BranchRemote remote;

  BranchRepositoryImpl({required this.remote});
  @override
  Future<List<BranchEntity>> getAllBranches() async {
    final branchesRemote = await remote.getAllBranches();
    final branchesEntity =
        branchesRemote.map((branchRemote) => branchRemote.toDomain()).toList();
    return branchesEntity;
  }

  @override
  Future<BranchEntity> getBranch(int id) async {
    final branchRemote = await remote.getBranch(id);
    final branchEntity = branchRemote.toDomain();
    return branchEntity;
  }
}
