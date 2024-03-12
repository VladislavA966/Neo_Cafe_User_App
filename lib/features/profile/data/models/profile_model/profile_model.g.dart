// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      customerId: json['customer_id'] as int?,
      firstName: json['first_name'] as String?,
      bonusPoints: json['bonus_points'] as int?,
      email: json['email'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrdersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'first_name': instance.firstName,
      'bonus_points': instance.bonusPoints,
      'email': instance.email,
      'orders': instance.orders,
    };
