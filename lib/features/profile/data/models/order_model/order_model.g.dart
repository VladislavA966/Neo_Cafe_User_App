// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'] as int?,
      totalPrice: json['total_price'] as int?,
      table: TableModel.fromJson(json['table'] as Map<String, dynamic>),
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      customer: json['customer'] as int?,
      updatedAt: json['updated_at'] as String?,
      completedAt: json['completed_at'] as String?,
      branch: json['branch'] as int?,
      orderType: json['order_type'] as String?,
      totalSum: json['total_sum'] as String?,
      employee: json['employee'] as int?,
      iTO: (json['ITO'] as List<dynamic>?)
          ?.map((e) => ItoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
      'table': instance.table,
      'status': instance.status,
      'created_at': instance.createdAt,
      'customer': instance.customer,
      'updated_at': instance.updatedAt,
      'completed_at': instance.completedAt,
      'branch': instance.branch,
      'order_type': instance.orderType,
      'total_sum': instance.totalSum,
      'employee': instance.employee,
      'ITO': instance.iTO,
    };
