
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_steps.dart';

class CheckOutStepsPageview extends StatelessWidget {
  const CheckOutStepsPageview({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: getSteps().length,
      itemBuilder: (context, index) {
        return SizedBox();
      },
    );
  }
}
