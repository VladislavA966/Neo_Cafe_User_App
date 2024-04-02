import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/order_history/data/mappers/ito_mapper.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/table_mappre.dart';
import 'package:neo_cafe_24/features/order_history/data/models/order_model/order_model.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';

class OrderMapper extends Mapper<OrdersModel, OrderEntity> {
  final ItoMapper itoMapper;

  OrderMapper({required this.itoMapper});

  @override
  OrderEntity mapper(OrdersModel model) {
    return OrderEntity(
        id: model.id ?? 0,
        orderNumber: model.orderNumber ?? 0,
        status: model.status ?? "",
        orderType: model.orderType ?? '',
        createdAt: model.createdAt ?? '',
        updatedAt: model.updatedAt ?? '',
        completedAt: model.completedAt ?? '',
        totalSum: model.totalSum ?? 0,
        iTO: model.iTO.map((ito) => itoMapper.mapper(ito)).toList());
  }
}
