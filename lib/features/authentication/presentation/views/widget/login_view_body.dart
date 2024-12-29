import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'كلمة المرور',
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: const Icon(
              Icons.remove_red_eye,
              color: Color(0xffC9CECF),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نسيت كلمة المرور؟',
                style: AppTextStyle.font13w600.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 33,
          ),
          CustomButton(
            text: 'تسجيل الدخول',
            onPressed: () {},
          ),
          SizedBox(
            height: 45,
          ),
          Text.rich(
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
          ),
          SizedBox(height: 33),
        ],
      ),
    );
  }
}
