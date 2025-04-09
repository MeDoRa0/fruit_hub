import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ActionButton(
        icon: Icons.add,
        iconColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          '3',
          style: AppTextStyle.font16Bold,
        ),
      ),
      ActionButton(
        icon: Icons.remove,
        iconColor: Color(0xFF969899),
        backgroundColor: Color(0xFFF1F1F5),
        onPressed: () {},
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
    return Container(
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
    );
  }
}
