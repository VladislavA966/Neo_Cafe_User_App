import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';

abstract class BranchRemote {
  Future<List<BranchModel>> getAllBranches();
  Future<BranchModel> getBranch(int id);
}

class BranchRemoteImpl implements BranchRemote {
  final Dio dio;

  BranchRemoteImpl({required this.dio});
  @override
  Future<List<BranchModel>> getAllBranches() async {
    final responce = await dio.get('/branch/all/');
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      List<dynamic> jsonData = responce.data;
      List<BranchModel> branches =
          jsonData.map((json) => BranchModel.fromJson(json)).toList();
      return branches;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BranchModel> getBranch(int id) async {
    final responce = await dio.get('/branch/$id/');
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      return BranchModel.fromJson(responce.data);
    } else {
      throw Exception();
    }
  }
}
