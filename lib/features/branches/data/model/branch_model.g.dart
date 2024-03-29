// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesModel _$BranchesModelFromJson(Map<String, dynamic> json) =>
    BranchesModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchesModelToJson(BranchesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      json['phone_number'] as String?,
      id: json['id'] as int?,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => SchedulesModel.fromJson(e as Map<String, dynamic>))
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
      'branch_name': instance.branchName,
      'address': instance.adress,
      'phone_number': instance.phoneNumber,
      'link_2gis': instance.link2gis,
      'table_quantity': instance.tableQuantity,
      'image': instance.image,
      'description': instance.description,
      'schedules': instance.schedules,
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
