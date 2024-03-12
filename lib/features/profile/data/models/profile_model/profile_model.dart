import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/profile/data/models/order_model/order_model.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "customer_id")
  int? customerId;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "bonus_points")
  int? bonusPoints;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "orders")
  List<OrdersModel>? orders;

  ProfileModel(
      {this.customerId,
      this.firstName,
      this.bonusPoints,
      this.email,
      this.orders});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
