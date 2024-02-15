class ItemEntity {
  final int id;

  final String name;

  final String description;

  final int category;

  final String itemImage;

  final String type;

  final int pricePerUnit;

  final int branch;

  ItemEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.itemImage,
      required this.type,
      required this.pricePerUnit,
      required this.branch});
}

class ItemsEntity {
  final List<ItemEntity> items;

  ItemsEntity({required this.items});
}
