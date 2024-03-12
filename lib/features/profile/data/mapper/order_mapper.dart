import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/ito_mapper.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/table_mappre.dart';
import 'package:neo_cafe_24/features/profile/data/models/order_model/order_model.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/order_entity.dart';

class OrderMapper extends Mapper<OrdersModel, OrdersEntity> {
  final TableMapper tableMapper;
  final ItoMapper itoMapper;

  OrderMapper({required this.tableMapper, required this.itoMapper});

  @override
  OrdersEntity mapper(OrdersModel model) {
    return OrdersEntity(
      id: model.id ?? 0,
      totalPrice: model.totalPrice ?? 0,
      table: tableMapper.mapper(model.table),
      status: model.status ?? '',
      createdAt: model.createdAt ?? '',
      updatedAt: model.updatedAt ?? '',
      completedAt: model.completedAt ?? '',
      orderType: model.orderType ?? '',
      employee: model.employee ?? 0,
      ito: model.iTO?.map(itoMapper.mapper).toList() ?? [],
      customer: model.branch ?? 0,
      branch: model.branch ?? 1,
      totalSum: '',
    );
  }
}
