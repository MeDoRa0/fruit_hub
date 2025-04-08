import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/best_selling_fruits.dart/views/best_selling_view.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength نتائج ',
          textAlign: TextAlign.right,
          style: AppTextStyle.font16Bold.copyWith(color: Colors.black),
        ),
        Spacer(),
      ],
    );
  }
}
