import 'package:neo_cafe_24/features/branches/data/data_source/remote/branch_remote_data_source.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/branch_to_entity.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/branches_to_entity_mapper.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/repo/branches_repo.dart';
import 'package:neo_cafe_24/features/menu_screen/data/mapper/menu_item_mapper.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';

class BranchRepositoryImpl implements BranchRepo {
  final BranchRemote remote;
  final BranchesToEnityMapper branchesMapper;
  final BranchToEntityMapper branchMapper;

  BranchRepositoryImpl(
      {required this.remote,
      required this.branchesMapper,
      required this.branchMapper});
  @override
  Future<List<BranchEntity>> getAllBranches() async {
    final branchesRemote = await remote.getAllBranches();
    final branchesEntity = branchesMapper.mapper(branchesRemote);
    return branchesEntity;
  }

  @override
  Future<BranchEntity> getBranch(int id) async {
    final branchRemote = await remote.getBranch(id);
    final branchEntity = branchMapper.mapper(branchRemote);
    return branchEntity;
  }

  @override
  Future<List<ItemEntity>> getBranchFavouriteItems() async {
    final favouriteItemsRemote = await remote.getBranchFavouriteItems();
    final favouriteItemsEntity =
        favouriteItemsRemote.map((item) => item.toDomain()).toList();
    return favouriteItemsEntity;
  }
}
