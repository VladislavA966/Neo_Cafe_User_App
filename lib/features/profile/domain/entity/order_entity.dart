import 'package:neo_cafe_24/features/profile/domain/entity/table_entity.dart';

class OrdersEntity {
  final int id;
  final int totalPrice;
  final TableEntity table;
  final String status;
  final String createdAt;
  final int customer;
  final String updatedAt;
  final String completedAt;
  final int branch;
  final String orderType;
  final String totalSum;
  final int employee;
  final List<ItoEntity> ito;

  OrdersEntity({
    required this.id,
    required this.totalPrice,
    required this.table,
    required this.status,
    required this.createdAt,
    required this.customer,
    required this.updatedAt,
    required this.completedAt,
    required this.branch,
    required this.orderType,
    required this.totalSum,
    required this.employee,
    required this.ito,
  });
}
