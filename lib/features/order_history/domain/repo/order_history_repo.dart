import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';

abstract class OrderHistoryRepo {
  Future<List<OrderEntity>> getOrderHistory();
}
