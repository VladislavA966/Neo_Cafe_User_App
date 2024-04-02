import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/profile/data/models/profile_model/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfileInfo();
  Future<ProfileModel> editProfileInfo(String firstName);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio dio;
  final LocalDataSource local;

  ProfileDataSourceImpl({required this.local, required this.dio});
  @override
  Future<ProfileModel> getProfileInfo() async {
    final customerId = await local.getCustomerId();
    final responce = await dio.get(
      '/profile/customer/$customerId/',
    );
    return ProfileModel.fromJson(responce.data);
  }

  @override
  Future<ProfileModel> editProfileInfo(String firstName) async {
    final customerId = await local.getCustomerId();
    final responce = await dio.put(
      '/profile/customer/$customerId/edit/',
      data: {
        "first_name": firstName,
      },
    );
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      return ProfileModel.fromJson(responce.data);
    } else {
      throw Exception();
    }
  }
}
