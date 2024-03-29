import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/profile/data/models/profile_model/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfileInfo();
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
}
