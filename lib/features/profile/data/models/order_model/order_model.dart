import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/profile/data/models/ito_model.dart/ito_model.dart';
import 'package:neo_cafe_24/features/profile/data/models/table_model.dart/table_model.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrdersModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "total_price")
  int? totalPrice;
  @JsonKey(name: "table")
  TableModel table;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "customer")
  int? customer;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "completed_at")
  String? completedAt;
  @JsonKey(name: "branch")
  int? branch;
  @JsonKey(name: "order_type")
  String? orderType;
  @JsonKey(name: "total_sum")
  String? totalSum;
  @JsonKey(name: "employee")
  int? employee;
  @JsonKey(name: "ITO")
  List<ItoModel>? iTO;

  OrdersModel(
      {this.id,
      this.totalPrice,
      required this.table,
      this.status,
      this.createdAt,
      this.customer,
      this.updatedAt,
      this.completedAt,
      this.branch,
      this.orderType,
      this.totalSum,
      this.employee,
      this.iTO});
  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}
