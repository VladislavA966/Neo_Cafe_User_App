import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/schedules_to_entity_mapper.dart';
import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';

class BranchToEntityMapper extends Mapper<BranchModel, BranchEntity> {
  final ScheDulesToEntityMapper schedulesMapper;

  BranchToEntityMapper({required this.schedulesMapper});
  @override
  BranchEntity mapper(BranchModel model) {
    return BranchEntity(
      id: model.id ?? 0,
      schedules: schedulesMapper.mapper(model.schedules),
      branchName: model.branchName ?? '',
      adress: model.adress ?? '',
      phoneNumber: model.phoneNumber ?? '',
      image: model.image ?? '',
      description: model.description ?? '',
      link2gis: model.link2gis ?? '',
      tableQuantity: model.tableQuantity ?? 0,
    );
  }
}
