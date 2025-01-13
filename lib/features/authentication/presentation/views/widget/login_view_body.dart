import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/custom_text_span.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/or_divider.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/social_login_button.dart';

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
          CustomTextSpan(
            firstText: 'لا تمتلك حساب؟',
            secondText: 'قم بإنشاء حساب',
            onTap: () {
              Navigator.pushNamed(context, SignupView.routeName);
            },
          ),
          SizedBox(height: 33),
          OrDivider(),
          SizedBox(height: 16),
          SocialLoginButton(
            label: 'تسجيل بواسطة جوجل',
            logo: Assets.iconsGoogleLogo,
            onPressed: () {},
          ),
          SizedBox(height: 16),
          SocialLoginButton(
            label: 'تسجيل بواسطة أبل',
            logo: Assets.iconsAppleLogo,
            onPressed: () {},
          ),
          SizedBox(height: 16),
          SocialLoginButton(
            label: 'تسجيل بواسطة فيسبوك',
            logo: Assets.iconsFacebookLogo,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
