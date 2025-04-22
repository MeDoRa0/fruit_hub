import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class AddressInput extends StatelessWidget {
  const AddressInput(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.name =
                      value!;
                },
                hintText: 'الاسم الكامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      value!;
                },
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.phone =
                      value!;
                },
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      value!;
                },
                hintText: 'العنوان',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.city =
                      value!;
                },
                hintText: 'المدينة',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context
                      .read<OrderEntity>()
                      .shippingAddressEntity!
                      .floorNumber = value!;
                },
                hintText: 'رقم الطابق',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  context
                      .read<OrderEntity>()
                      .shippingAddressEntity!
                      .apartmentNumber = value!;
                },
                hintText: ' رقم الشقة',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
