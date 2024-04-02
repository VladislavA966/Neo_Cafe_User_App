import 'package:neo_cafe_24/features/order_history/domain/entity/itro_entity.dart';

class OrderEntity {
  final int id;
  final int orderNumber;
  final String status;
  final String orderType;
  final String createdAt;
  final String updatedAt;
  final String completedAt;
  final int totalSum;
  final List<ItoEntity> iTO;

  OrderEntity(
      {required this.id,
      required this.orderNumber,
      required this.status,
      required this.orderType,
      required this.createdAt,
      required this.updatedAt,
      required this.completedAt,
      required this.totalSum,
      required this.iTO});
}
