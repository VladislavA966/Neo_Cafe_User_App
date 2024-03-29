import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/branches/data/model/branch_model.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';

class ScheDulesToEntityMapper
    extends Mapper<List<SchedulesModel>, List<SchedulesEntity>> {
  @override
  List<SchedulesEntity> mapper(List<SchedulesModel> model) {
    final schedulesEntity = model
        .map((schedule) => SchedulesEntity(
            day: schedule.day ?? '',
            startTime: schedule.startTime ?? '',
            endTime: schedule.endTime ?? ''))
        .toList();
    return schedulesEntity;
  }
}
