import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(
            cartItemEntity: cartItems[index],
          ),
        );
      },
    );
  }
}
