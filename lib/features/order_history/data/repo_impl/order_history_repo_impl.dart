import 'package:neo_cafe_24/features/order_history/data/mappers/order_mapper.dart';
import 'package:neo_cafe_24/features/order_history/data/remote_data/order_history_remote.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';
import 'package:neo_cafe_24/features/order_history/domain/repo/order_history_repo.dart';

class OrderHistoryRepoImpl implements OrderHistoryRepo {
  final OrderHistoryRemoteData remoteData;
  final OrderMapper orderMapper;

  OrderHistoryRepoImpl({required this.remoteData, required this.orderMapper});
  @override
  Future<List<OrderEntity>> getOrderHistory() async {
    final remoteOrderData = await remoteData.getOrderHistory();
    final orderEnityData = remoteOrderData
        .map(
          (order) => orderMapper.mapper(
            order,
          ),
        )
        .toList();
    return orderEnityData;
  }
}
