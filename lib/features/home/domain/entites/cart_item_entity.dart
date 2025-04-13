import 'package:fruit_hub/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
   int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});
}