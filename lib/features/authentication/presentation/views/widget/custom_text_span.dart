import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });
  final String firstText, secondText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: AppTextStyle.font16SemiBold.copyWith(
              color: Color(0xFF616A6B),
              height: 1.40,
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyle.font16SemiBold.copyWith(
              color: Color(0xFF616A6B),
              height: 1.40,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap();
              },
            text: secondText,
            style: AppTextStyle.font16SemiBold.copyWith(
              color: AppColors.primaryColor,
              height: 1.40,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
