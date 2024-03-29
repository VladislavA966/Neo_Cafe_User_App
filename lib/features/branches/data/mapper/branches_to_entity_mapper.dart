import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/schedules_to_entity_mapper.dart';
import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';

class BranchesToEnityMapper extends Mapper<BranchesModel, List<BranchEntity>> {
  final ScheDulesToEntityMapper scheduleMapper;

  BranchesToEnityMapper({required this.scheduleMapper});
  @override
  List<BranchEntity> mapper(BranchesModel model) {
    final branchesEntity = model.results
        .map(
          (branches) => BranchEntity(
            id: branches.id ?? 0,
            schedules: scheduleMapper.mapper(branches.schedules),
            branchName: branches.branchName ?? '',
            adress: branches.adress ?? '',
            phoneNumber: branches.phoneNumber ?? '',
            image: branches.image ?? '',
            description: branches.description ?? '',
            link2gis: branches.link2gis ?? '',
            tableQuantity: branches.tableQuantity ?? 0,
          ),
        )
        .toList();
    return branchesEntity;
  }
}
