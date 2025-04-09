import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF9F1),
      ),
      child: Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: AppTextStyle.font13w400.copyWith(
            color: Color(0xFF1B5E37),
          ),
        ),
      ),
    );
  }
}
