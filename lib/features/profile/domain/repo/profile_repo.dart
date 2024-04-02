import 'package:neo_cafe_24/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepo {
  Future<ProfileEntity> getProfileInfo();
  Future<ProfileEntity> editProfileInfo(String firstName);
}