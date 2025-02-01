import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/best_selling_fruits.dart/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: AppTextStyle.font16Bold.copyWith(color: Colors.black),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              BestSellingView.routeName,
            );
          },
          child: Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyle.font13w400.copyWith(
              color: Color(0xFF949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
