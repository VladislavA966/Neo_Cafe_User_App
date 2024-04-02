import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/profile_entity.dart';
import 'package:neo_cafe_24/features/profile/domain/repo/profile_repo.dart';

class EditProfileUseCase extends UseCase<ProfileEntity, String> {
  final ProfileRepo repo;

  EditProfileUseCase({required this.repo});
  @override
  Future<ProfileEntity> call(String params) async {
    return await repo.editProfileInfo(params);
  }
}
