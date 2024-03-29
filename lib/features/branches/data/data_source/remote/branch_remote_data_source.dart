import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/menu_item_model.dart/menu_all_item_model.dart';

abstract class BranchRemote {
  Future<BranchesModel> getAllBranches();
  Future<BranchModel> getBranch(int id);
  Future<List<ItemModel>> getBranchFavouriteItems();
}

class BranchRemoteImpl implements BranchRemote {
  final BranchLocalData localData;
  final Dio dio;

  BranchRemoteImpl({required this.dio, required this.localData});
  @override
  Future<BranchesModel> getAllBranches() async {
    final responce = await dio.get('/branch/all/');
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      return BranchesModel.fromJson(responce.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<BranchModel> getBranch(int id) async {
    final responce = await dio.get('/branch/$id/');
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      final branch = BranchModel.fromJson(responce.data);
      await localData.saveBranchId(branch.id ?? 0);
      return branch;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<ItemModel>> getBranchFavouriteItems() async {
    final branchId = await localData.getBranchId();
    final responce =
        await dio.get('/branches/$branchId/top-selling-menu-items/');
    final List<dynamic> jsonData = responce.data;
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      final items = jsonData.map((item) => ItemModel.fromJson(item)).toList();
      return items;
    } else {
      throw Exception();
    }
  }
}
