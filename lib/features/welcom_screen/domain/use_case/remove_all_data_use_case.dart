import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/welcom_screen/domain/repo/remove_all_data_repo.dart';

class RemoveAllDataUseCase extends UseCase<void, void> {
  final RemoveAllDataRepo repo;

  RemoveAllDataUseCase({required this.repo});
  @override
  Future<void> call(void params) async {
    await repo.removeAllData();
  }
}
