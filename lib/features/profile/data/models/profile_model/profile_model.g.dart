// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      firstName: json['first_name'] as String?,
      bonusPoints: json['bonus_points'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'email': instance.email,
      'bonus_points': instance.bonusPoints,
    };
