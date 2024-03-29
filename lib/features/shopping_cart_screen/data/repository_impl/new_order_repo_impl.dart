import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/data_source/local/cart_local_data_source.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/data_source/remote/new_order_remote.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/mapper/item_order_to_model_mapper.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/new_order_model/new_order_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/repo/new_order_repo.dart';

class NewOrderRepoImpl implements NewOrderRepo {
  final NewOrderRemote newOrderRemote;
  final CartLocalDataSourceImpl cartLocal;
  final BranchLocalData branchLocal;
  final ItemOrderToModelMapper itemMapper;

  NewOrderRepoImpl(
      {required this.newOrderRemote,
      required this.cartLocal,
      required this.branchLocal,
      required this.itemMapper});
  @override
  Future<void> sendNewOrder(int bonusPoints) async {
    final items = await cartLocal.getItems();
    final orderItems = itemMapper.mapper(items);
    final branchId = await branchLocal.getBranchId();
    final order = NewOrderModel(
        ito: orderItems,
        orderType: 'Takeaway',
        branch: branchId ?? 0,
        bonusPointToSubtract: bonusPoints);
    await newOrderRemote.sendNewOrder(order);
  }
}
