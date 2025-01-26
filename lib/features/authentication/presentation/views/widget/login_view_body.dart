import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/authentication/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/custom_text_span.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/or_divider.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password, name;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidate,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<LoginCubit>().signInWithEmailAndPassword(
                      email: email, password: password, name: name);
                } else {
                  setState(() {
                    autoValidate = AutovalidateMode.onUserInteraction;
                  });
                }
              },
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
              onPressed: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
            ),
            SizedBox(height: 16),
            // Apple login is only available for iOS
            Platform.isIOS
                ? SocialLoginButton(
                    label: 'تسجيل بواسطة أبل',
                    logo: Assets.iconsAppleLogo,
                    onPressed: () {
                      context.read<LoginCubit>().signInWithApple();
                    },
                  )
                : SizedBox(),
            SizedBox(height: 16),
            SocialLoginButton(
              label: 'تسجيل بواسطة فيسبوك',
              logo: Assets.iconsFacebookLogo,
              onPressed: () {
                context.read<LoginCubit>().signInWithFacebook();
              },
            )
          ],
        ),
      ),
    );
  }
}
