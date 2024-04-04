import 'package:json_annotation/json_annotation.dart';
part 'ito_model.g.dart';

@JsonSerializable()
class ItoModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "item")
  final int? item;
  @JsonKey(name: "item_name")
  final String? name;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: "total_price")
  final int? totalPrice;
  @JsonKey(name: "item_price")
  final int? itemPrice;

  factory ItoModel.fromJson(Map<String, dynamic> json) =>
      _$ItoModelFromJson(json);

  ItoModel(
      {required this.id,
      required this.item,
      required this.name,
      required this.quantity,
      required this.totalPrice,
      required this.itemPrice});

  Map<String, dynamic> toJson() => _$ItoModelToJson(this);
}
