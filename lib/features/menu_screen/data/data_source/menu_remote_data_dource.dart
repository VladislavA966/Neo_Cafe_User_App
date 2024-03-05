import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/category/category_model.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/menu_item_model.dart/menu_all_item_model.dart';

abstract class MenuRemote {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<ItemModel>> getAllItems(int categoryId);
  Future<ItemModel> getItem(int id);
}

class MenuRemoteImpl implements MenuRemote {
  final BranchLocalData local;
  final Dio dio;

  MenuRemoteImpl({required this.dio, required this.local});
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await dio.get('/menu/category/all/');
    if (response.statusCode == 201 || response.statusCode == 200) {
      List<dynamic> jsonData = response.data;
      List<CategoryModel> categories =
          jsonData.map((json) => CategoryModel.fromJson(json)).toList();
      return categories;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<ItemModel>> getAllItems(int categoyID) async {
    final branchId = await local.getBranchId();
    final responce = await dio.get(
      '/branch-menu/$branchId/$categoyID/',
    );
    List<dynamic> jsonData = responce.data;
    List<ItemModel> items =
        jsonData.map((json) => ItemModel.fromJson(json)).toList();
    return items;
  }

  @override
  Future<ItemModel> getItem(int id) async {
    final responce = await dio.get(
      '/menu/item/$id/',
      options: Options(
        extra: {"requiresToken": true},
      ),
    );
    if (responce.statusCode == 200 || responce.statusCode == 200) {
      return ItemModel.fromJson(responce.data);
    } else {
      throw Exception(['Что то пошло не так']);
    }
  }
}
