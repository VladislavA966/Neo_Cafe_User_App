import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';
import 'package:neo_cafe_24/features/order_history/domain/repo/order_history_repo.dart';

class OrderInfoUseCase extends UseCase<OrderEntity, int> {
  final OrderHistoryRepo repo;

  OrderInfoUseCase({required this.repo});
  @override
  Future<OrderEntity> call(int params) async {
    return await repo.getOrderInfo(params);
  }
}
