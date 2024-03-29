import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/cart_item_model/cart_item_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/new_order_ito_model.dart/new_order_ito_model.dart';

class ItemOrderToModelMapper
    extends Mapper<List<CartItemModel>, List<NewOrderItoModel>> {
  @override
  List<NewOrderItoModel> mapper(List<CartItemModel> model) {
    final itoModel = model
        .map(
          (item) => NewOrderItoModel(
            item: item.id,
            quantity: item.quantity,
          ),
        )
        .toList();
    return itoModel;
  }
}
