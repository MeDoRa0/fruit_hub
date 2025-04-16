import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_views.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            text:
                'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}  جنية',
            onPressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutViews.routeName,
                    // Pass the cart items to the CheckoutViews
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('لا يوجد منتج في السلة'),
                  ),
                );
              }
            });
      },
    );
  }
}
