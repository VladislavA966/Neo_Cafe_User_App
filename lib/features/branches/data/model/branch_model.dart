import 'package:json_annotation/json_annotation.dart';
part 'branch_model.g.dart';

@JsonSerializable()
class BranchModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'schedules')
  final List<SchedulesModel>? schedules;
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @JsonKey(name: "address")
  final String? adress;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'link_2gis')
  final String? link2gis;
  @JsonKey(name: 'table_quantity')
  final int? tableQuantity;

  BranchModel(this.phoneNumber,
      {required this.id,
      required this.schedules,
      required this.branchName,
      required this.adress,
      required this.image,
      required this.description,
      required this.link2gis,
      required this.tableQuantity});
  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}

@JsonSerializable()
class SchedulesModel {
  @JsonKey(name: "day")
  final String? day;
  @JsonKey(name: "start_time")
  final String? startTime;
  @JsonKey(name: "end_time")
  final String? endTime;

  SchedulesModel(
      {required this.day, required this.startTime, required this.endTime});
  factory SchedulesModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulesModelFromJson(json);
}
