part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();

  List<Object> get props => [];
}

final class CartItemInitial extends CartItemState {}

final class CartItemQuantityUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;
  const CartItemQuantityUpdated(this.cartItemEntity);
}
