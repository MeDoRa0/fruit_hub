import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(),
        );
      },
    );
  }
}
