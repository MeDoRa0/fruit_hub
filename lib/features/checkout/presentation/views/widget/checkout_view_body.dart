import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_steps_pageview.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(),
          Expanded(
            child: CheckOutStepsPageview(pageController: pageController),
          ),
          CustomButton(
            text: 'التالي',
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
