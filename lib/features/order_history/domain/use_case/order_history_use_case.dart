import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';
import 'package:neo_cafe_24/features/order_history/domain/repo/order_history_repo.dart';

class OrderHistoryUseCase extends UseCase<List<OrderEntity>, void> {
  final OrderHistoryRepo repo;

  OrderHistoryUseCase({required this.repo});
  @override
  Future<List<OrderEntity>> call(void params) async {
    return await repo.getOrderHistory();
  }
}
