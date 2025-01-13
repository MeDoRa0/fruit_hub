import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/custom_text_span.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/terms_of_service.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
              hintText: 'الإسم كامل', keyboardType: TextInputType.name),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
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
          TermsOfService(),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'إنشاء حساب جديد',
            onPressed: () {},
          ),
          SizedBox(
            height: 26,
          ),
          CustomTextSpan(
            firstText: 'تمتلك حساب بالفعل؟',
            secondText: 'تسجيل دخول',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
