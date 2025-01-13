import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟',
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
            text: 'قم بإنشاء حساب',
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