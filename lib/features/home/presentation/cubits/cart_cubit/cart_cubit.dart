import 'dart:developer' as dev;
import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/domain/repository/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  final FirebaseAuthService _firebaseAuthService;
  CartEntity cartEntity = CartEntity([]);

  CartCubit({
    required CartRepo cartRepo,
    required FirebaseAuthService firebaseAuthService,
  })  : _cartRepo = cartRepo,
        _firebaseAuthService = firebaseAuthService,
        super(CartInitial()) {
    loadCart();
  }

  Future<void> loadCart() async {
    emit(CartLoading());
    final userId = _firebaseAuthService.currentUser?.uid;
    if (userId == null) {
      dev.log('User not logged in');
      emit(CartError(message: 'User not logged in'));
      return;
    }

    final result = await _cartRepo.getCart(userId);
    result.fold(
      (failure) {
        dev.log('Failed to load cart: ${failure.message}');
        emit(CartError(message: failure.message));
      },
      (cart) {
        cartEntity = cart;
        emit(CartLoaded(cart: cart));
      },
    );
  }

  Future<void> addProductToCart(ProductEntity productEntity) async {
    emit(CartLoading());
    final userId = _firebaseAuthService.currentUser?.uid;
    if (userId == null) {
      dev.log('User not logged in');
      emit(CartError(message: 'User not logged in'));
      return;
    }

    try {
      bool isProductInCart = cartEntity
          .isProductInCart(CartItemEntity(productEntity: productEntity));
      var cartItem =
          cartEntity.getCartItem(CartItemEntity(productEntity: productEntity));

      if (isProductInCart) {
        cartItem.incrementQuantity();
      } else {
        cartEntity.addItemTocart(cartItem);
      }

      dev.log('Adding to cart: ${cartEntity.cartItems.length} items');
      final result = await _cartRepo.addToCart(userId, cartEntity);
      result.fold(
        (failure) {
          dev.log('Failed to add to cart: ${failure.message}');
          emit(CartError(message: failure.message));
        },
        (_) => emit(CartItemAdded()),
      );
    } catch (e) {
      dev.log('Error in addProductToCart: $e');
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> deleteCartItem(CartItemEntity cartItemEntity) async {
    emit(CartLoading());
    final userId = _firebaseAuthService.currentUser?.uid;
    if (userId == null) {
      dev.log('User not logged in');
      emit(CartError(message: 'User not logged in'));
      return;
    }

    try {
      cartEntity.removeItemFromCart(cartItemEntity);
      final result = await _cartRepo.updateCart(userId, cartEntity);
      result.fold(
        (failure) {
          dev.log('Failed to delete cart item: ${failure.message}');
          emit(CartError(message: failure.message));
        },
        (_) => emit(CartItemRemoved()),
      );
    } catch (e) {
      dev.log('Error in deleteCartItem: $e');
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(CartItemEntity cartItemEntity) async {
    emit(CartLoading());
    final userId = _firebaseAuthService.currentUser?.uid;
    if (userId == null) {
      dev.log('User not logged in');
      emit(CartError(message: 'User not logged in'));
      return;
    }

    try {
      // Update the cart item in the local cart entity
      final index = cartEntity.cartItems.indexWhere(
        (item) => item.productEntity.code == cartItemEntity.productEntity.code,
      );
      if (index != -1) {
        cartEntity.cartItems[index] = cartItemEntity;
      }

      // Update the cart in Firebase
      final result = await _cartRepo.updateCart(userId, cartEntity);
      result.fold(
        (failure) {
          dev.log('Failed to update cart item quantity: ${failure.message}');
          emit(CartError(message: failure.message));
        },
        (_) => emit(CartItemUpdated()),
      );
    } catch (e) {
      dev.log('Error in updateCartItemQuantity: $e');
      emit(CartError(message: e.toString()));
    }
  }
}
