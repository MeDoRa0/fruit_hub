import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(CartItemQuantityUpdated(cartItemEntity));
  }
}
