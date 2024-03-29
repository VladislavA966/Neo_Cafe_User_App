import 'package:json_annotation/json_annotation.dart';

part 'new_order_ito_model.g.dart';

@JsonSerializable()
class NewOrderItoModel {
  final int item;
  final int quantity;

  NewOrderItoModel({required this.item, required this.quantity});
  factory NewOrderItoModel.fromJson(Map<String, dynamic> json) =>
      _$NewOrderItoModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewOrderItoModelToJson(this);
}
