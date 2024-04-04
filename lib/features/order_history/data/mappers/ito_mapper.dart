import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/order_history/data/models/ito_model.dart/ito_model.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/itro_entity.dart';

class ItoMapper extends Mapper<ItoModel, ItoEntity> {
  @override
  ItoEntity mapper(ItoModel model) {
    return ItoEntity(
      id: model.id ?? 0,
      item: model.item ?? 0,
      quantity: model.quantity ?? 0,
      name: model.name ?? '',
      totalPrice: model.totalPrice ?? 0,
      itemPrice: model.itemPrice ?? 0,
    );
  }
}
