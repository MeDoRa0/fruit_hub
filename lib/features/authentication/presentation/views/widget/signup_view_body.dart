import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/custom_text_span.dart';
import 'package:fruit_hub/core/widgets/password_field.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/terms_of_service.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  // Create a global key that uniquely identifies the Form widget
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Create a global variable to store the AutovalidateMode
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  late String name, email, password;
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
                // Save the value of the text field
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'الإسم كامل',
                keyboardType: TextInputType.name),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              // Save the value of the text field
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16,
            ),
            PasswordField(onSaved: (value) {
              password = value!;
              
            },),
            SizedBox(
              height: 16,
            ),
            TermsOfService(),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'إنشاء حساب جديد',
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // If the form is valid, display a Snackbar
                  context.read<SignupCubit>().createUserWithEmailAndPassword(
                        name: name,
                        email: email,
                        password: password,
                      );
                } else {
                  // If the form is invalid, display an error
                  setState(() {
                    autoValidate = AutovalidateMode.onUserInteraction;
                  });
                }
              },
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
      ),
    );
  }
}

