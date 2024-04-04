import 'package:neo_cafe_24/features/welcom_screen/data/data_source/remove_user_data.dart';
import 'package:neo_cafe_24/features/welcom_screen/domain/repo/remove_all_data_repo.dart';

class RemoveAllDataRepoImpl implements RemoveAllDataRepo {
  final RemoveUserDataImpl dataSource;

  RemoveAllDataRepoImpl({required this.dataSource});
  @override
  Future<void> removeAllData() async {
    await dataSource.remoteUserData();
  }
}
