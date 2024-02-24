// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      json['phone_number'] as String?,
      id: json['id'] as int?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => SchedulesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      branchName: json['branch_name'] as String?,
      adress: json['address'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      link2gis: json['link_2gis'] as String?,
      tableQuantity: json['table_quantity'] as int?,
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedules': instance.schedules,
      'branch_name': instance.branchName,
      'address': instance.adress,
      'phone_number': instance.phoneNumber,
      'image': instance.image,
      'description': instance.description,
      'link_2gis': instance.link2gis,
      'table_quantity': instance.tableQuantity,
    };

SchedulesModel _$SchedulesModelFromJson(Map<String, dynamic> json) =>
    SchedulesModel(
      day: json['day'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$SchedulesModelToJson(SchedulesModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
