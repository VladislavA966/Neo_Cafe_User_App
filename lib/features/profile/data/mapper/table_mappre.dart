import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/profile/data/models/table_model.dart/table_model.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/table_entity.dart';

class TableMapper extends Mapper<TableModel, TableEntity> {
  @override
  TableEntity mapper(TableModel model) {
    return TableEntity(
        tableNumber: model.tableNumber ?? 0, status: model.status ?? '');
  }
}
