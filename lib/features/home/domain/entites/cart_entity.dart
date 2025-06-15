import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  double calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item.calculateTotalPrice());
  }

  bool isProductInCart(CartItemEntity product) {
    return cartItems
        .any((item) => item.productEntity.code == product.productEntity.code);
  }

  CartItemEntity getCartItem(CartItemEntity product) {
    return cartItems.firstWhere(
      (item) => item.productEntity.code == product.productEntity.code,
      orElse: () => product,
    );
  }

  void addItemTocart(CartItemEntity item) {
    cartItems.add(item);
  }

  void removeItemFromCart(CartItemEntity item) {
    cartItems.removeWhere(
        (element) => element.productEntity.code == item.productEntity.code);
  }
}
