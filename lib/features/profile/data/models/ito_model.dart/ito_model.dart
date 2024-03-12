
import 'package:json_annotation/json_annotation.dart';
part 'ito_model.g.dart';
@JsonSerializable()
class ItoModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "item")
  int? item;
  @JsonKey(name: 'quantity')
  int? quantity;

  ItoModel({this.id, this.item, this.quantity});
  factory ItoModel.fromJson(Map<String, dynamic> json) => _$ItoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItoModelToJson(this);

}

