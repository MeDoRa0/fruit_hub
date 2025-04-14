import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class CheckoutActiveStepsItem extends StatelessWidget {
  const CheckoutActiveStepsItem({super.key, required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style:
              AppTextStyle.font13Bold.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
