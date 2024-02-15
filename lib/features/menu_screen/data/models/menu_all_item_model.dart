import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:hive/hive.dart';
part "menu_all_item_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;

  @HiveField(1)
  @JsonKey(name: "name")
  final String? name;

  @HiveField(2)
  @JsonKey(name: "description")
  final String? description;

  @HiveField(3)
  @JsonKey(name: "category")
  final int? category;

  @HiveField(4)
  @JsonKey(name: "item_image")
  final String? itemImage;

  @HiveField(5)
  @JsonKey(name: "type")
  final String? type;

  @HiveField(6)
  @JsonKey(name: "price_per_unit")
  final int? pricePerUnit;

  @HiveField(7)
  @JsonKey(name: "branch")
  final int? branch;

  ItemModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.itemImage,
      required this.type,
      required this.pricePerUnit,
      required this.branch});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
  ItemEntity toEntity() => ItemEntity(
      id: id ?? 0,
      name: name ?? '',
      description: description ?? '',
      category: category ?? 0,
      itemImage: itemImage ?? '',
      type: type ?? '',
      pricePerUnit: pricePerUnit ?? 0,
      branch: branch ?? 0);
}


  



// @JsonSerializable()
// class ItemsModel {
//   final List<ItemModel> items;

//   ItemsModel({required this.items});

//   factory ItemsModel.fromJson(Map<String, dynamic> json) =>
//       _$ItemsModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ItemsModelToJson(this);

//   ItemsEntity toEntity() {
//     return ItemsEntity(items: items.map((model) => model.toEntity()).toList());
//   }
// }
