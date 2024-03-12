import 'package:neo_cafe_24/features/profile/data/data_source/profile_data_source.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/profile_mapper.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/profile_entity.dart';
import 'package:neo_cafe_24/features/profile/domain/repo/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepo {
  final ProfileDataSource remote;
  final ProfileMapper profileMapper;

  ProfileRepositoryImpl({required this.remote, required this.profileMapper});
  @override
  Future<ProfileEntity> getProfileInfo() async {
    final remoteData = await remote.getProfileInfo();
    final profileEnity = profileMapper.mapper(remoteData);
    return profileEnity;
  }
}
