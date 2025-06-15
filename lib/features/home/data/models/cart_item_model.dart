import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      productEntity: product.toEntity(),
      quantity: quantity,
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: ProductModel.fromEntity(entity.productEntity),
      quantity: entity.quantity,
    );
  }
}
