import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 26),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0x66CACECE),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.iconsFilter),
        )
      ],
    );
  }
}
