import 'package:fruit_hub/features/home/data/models/cart_item_model.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';

class CartModel {
  final List<CartItemModel> cartItems;

  CartModel({required this.cartItems});

  Map<String, dynamic> toJson() {
    return {
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartItems: (json['cartItems'] as List)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      cartItems.map((item) => item.toEntity()).toList(),
    );
  }

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      cartItems: entity.cartItems
          .map((item) => CartItemModel.fromEntity(item))
          .toList(),
    );
  }
}
