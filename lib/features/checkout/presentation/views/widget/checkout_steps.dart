import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentStepIndex,
      required this.pageController, required this.onTap});
  final int currentStepIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StepItem(
              isActive: index <= currentStepIndex,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return [
    ' الشحن',
    'العنوان',
    'الدفع',
  ];
}
