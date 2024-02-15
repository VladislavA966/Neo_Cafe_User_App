import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/category_entity.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String? name;
  // final String? image;

  CategoryModel({
    this.id,
    this.name,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  CategoryEntity toEntity() => CategoryEntity(
        id: id ?? 0,
        name: name ?? '',
        // image: image ?? '',
      );

  
}

// @JsonSerializable()
// class CategoriesModel {
//   final List<CategoryModel> categories;

//   CategoriesModel({required this.categories});
//   factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
//       _$CategoriesModelFromJson(json);
//   Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

//   CategoriesEntity toEntity() => CategoriesEntity(
//       categories: categories.map((model) => model.toEntity()).toList());
// }
