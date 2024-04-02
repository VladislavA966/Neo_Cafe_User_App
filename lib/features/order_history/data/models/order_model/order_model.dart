import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/order_history/data/models/ito_model.dart/ito_model.dart';
import 'package:neo_cafe_24/features/profile/data/models/profile_model/profile_model.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrdersModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "order_number")
  final int? orderNumber;
  @JsonKey(name: "order_status")
  final String? status;
  @JsonKey(name: "order_type")
  final String? orderType;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "completed_at")
  final String? completedAt;
  @JsonKey(name: "customer_profile")
  final ProfileModel? profile;
  @JsonKey(name: "total_sum")
  final int? totalSum;
  @JsonKey(name: "ITO")
  final List<ItoModel> iTO;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  OrdersModel(
      {required this.id,
      required this.orderNumber,
      required this.status,
      required this.orderType,
      required this.createdAt,
      required this.updatedAt,
      required this.completedAt,
      required this.profile,
      required this.totalSum,
      required this.iTO});

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}
