import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ActionButton(
        icon: Icons.add,
        iconColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          cartItemEntity.incrementQuantity();
          context.read<CartItemCubit>().updateCartItem(cartItemEntity);
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          cartItemEntity.quantity.toString(),
          style: AppTextStyle.font16Bold,
        ),
      ),
      ActionButton(
        icon: Icons.remove,
        iconColor: Color(0xFF969899),
        backgroundColor: Color(0xFFF1F1F5),
        onPressed: () {
          cartItemEntity.decrementQuantity();
          context.read<CartItemCubit>().updateCartItem(cartItemEntity);
        },
      ),
    ]);
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.backgroundColor,
      required this.iconColor});
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
