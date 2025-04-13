part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();

  @override
  List<Object> get props => [];
}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;
  const CartItemUpdated(this.cartItemEntity);
}
