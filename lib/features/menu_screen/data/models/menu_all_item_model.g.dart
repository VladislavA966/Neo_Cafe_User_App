// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_all_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 0;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      category: fields[3] as int?,
      itemImage: fields[4] as String?,
      type: fields[5] as String?,
      pricePerUnit: fields[6] as int?,
      branch: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.itemImage)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.pricePerUnit)
      ..writeByte(7)
      ..write(obj.branch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as int?,
      itemImage: json['item_image'] as String?,
      type: json['type'] as String?,
      pricePerUnit: json['price_per_unit'] as int?,
      branch: json['branch'] as int?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'item_image': instance.itemImage,
      'type': instance.type,
      'price_per_unit': instance.pricePerUnit,
      'branch': instance.branch,
    };
