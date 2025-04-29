import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});
  factory ItemList.fromEntity(List<CartItemEntity> itemEntities) {
    return ItemList(
      items: itemEntities.map((item) => ItemEntity.fromEntity(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
