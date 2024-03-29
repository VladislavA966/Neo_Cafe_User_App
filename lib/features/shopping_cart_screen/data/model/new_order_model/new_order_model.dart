import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/new_order_ito_model.dart/new_order_ito_model.dart';

part 'new_order_model.g.dart';

@JsonSerializable()
class NewOrderModel {
  @JsonKey(name: "ITO")
  final List<NewOrderItoModel> ito;
  @JsonKey(name: "order_type")
  final String orderType;
  @JsonKey(name: "branch")
  final int branch;
  @JsonKey(name: "bonus_points_to_subtract")
  final int bonusPointToSubtract;

  NewOrderModel(
      {required this.ito,
      required this.orderType,
      required this.branch,
      required this.bonusPointToSubtract});

  factory NewOrderModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewOrderModelToJson(this);
}
