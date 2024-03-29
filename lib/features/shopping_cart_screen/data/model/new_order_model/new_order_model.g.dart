// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderModel _$NewOrderModelFromJson(Map<String, dynamic> json) =>
    NewOrderModel(
      ito: (json['ITO'] as List<dynamic>)
          .map((e) => NewOrderItoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderType: json['order_type'] as String,
      branch: json['branch'] as int,
      bonusPointToSubtract: json['bonus_points_to_subtract'] as int,
    );

Map<String, dynamic> _$NewOrderModelToJson(NewOrderModel instance) =>
    <String, dynamic>{
      'ITO': instance.ito,
      'order_type': instance.orderType,
      'branch': instance.branch,
      'bonus_points_to_subtract': instance.bonusPointToSubtract,
    };
