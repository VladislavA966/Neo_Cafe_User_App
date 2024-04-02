// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'] as int?,
      orderNumber: json['order_number'] as int?,
      status: json['order_status'] as String?,
      orderType: json['order_type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      completedAt: json['completed_at'] as String?,
      profile: json['customer_profile'] == null
          ? null
          : ProfileModel.fromJson(
              json['customer_profile'] as Map<String, dynamic>),
      totalSum: json['total_sum'] as int?,
      iTO: (json['ITO'] as List<dynamic>)
          .map((e) => ItoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'order_status': instance.status,
      'order_type': instance.orderType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'completed_at': instance.completedAt,
      'customer_profile': instance.profile,
      'total_sum': instance.totalSum,
      'ITO': instance.iTO,
    };
