// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      customerId: json['id'] as int?,
      firstName: json['first_name'] as String?,
      bonusPoints: json['bonus_points'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.customerId,
      'first_name': instance.firstName,
      'email': instance.email,
      'bonus_points': instance.bonusPoints,
    };
