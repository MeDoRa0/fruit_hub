import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }
  bool isProductInCart(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }

  addItemTocart(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
  removeItemFromCart(CartItemEntity  cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }
}
