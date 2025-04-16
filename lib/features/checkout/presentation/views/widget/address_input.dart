import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class AddressInput extends StatelessWidget {
  const AddressInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: 'الاسم الكامل',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'المدينة',
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hintText: ' رقم الشقة',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
