// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ito_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItoModel _$ItoModelFromJson(Map<String, dynamic> json) => ItoModel(
      id: json['id'] as int?,
      item: json['item'] as int?,
      name: json['item_name'] as String?,
      quantity: json['quantity'] as int?,
      totalPrice: json['total_price'] as int?,
      itemPrice: json['item_price'] as int?,
    );

Map<String, dynamic> _$ItoModelToJson(ItoModel instance) => <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'item_name': instance.name,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
      'item_price': instance.itemPrice,
    };
