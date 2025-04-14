import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_active_steps_item.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.text,
      required this.index,
      required this.isActive});
  final String text;
  final String index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(index: index, text: text),
      secondChild: CheckoutActiveStepsItem(text: text),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
      sizeCurve: Curves.easeInOut,
    );
  }
}
