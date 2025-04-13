import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity([]);

  void addProductToCart(ProductEntity productEntity) {
    bool isProductInCart = cartEntity.isProductInCart(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductInCart) {
      cartItem.incrementQuantity();
    } else {
      cartEntity.addItemTocart(cartItem);
    }

    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeItemFromCart(cartItemEntity);
    emit(CartItemRemoved());
  }
}
