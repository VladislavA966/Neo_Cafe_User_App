import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/menu_screen/data/models/menu_all_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  List<ItemModel> items;

  CartModel({required this.items});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  void addItem(ItemModel item) {
    items.add(item);
    save();
  }

  void removeItemAt(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      save();
    }
  }

  void removeItemById(int id) {
    items.removeWhere((item) => item.id == id);
    save();
  }

  void clearCart() {
    items.clear();
    save();
  }

  int getTotalPrice() {
    return items.fold(
        0, (total, current) => total + (current.pricePerUnit ?? 0));
  }
}
