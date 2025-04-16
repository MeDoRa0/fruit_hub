import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_steps_pageview.dart';
import 'package:provider/provider.dart';

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
    // Listen to the page controller to update the current step index
    pageController.addListener(() {
      setState(() {
        currentStepIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentStepIndex: currentStepIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckOutStepsPageview(pageController: pageController),
          ),
          CustomButton(
            text: getNextButtonText(currentStepIndex),
            onPressed: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('يرجي تحديد طريقه الدفع'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  String getNextButtonText(int currentStepIndex) {
    switch (currentStepIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return ' pay with paypal  ';
      default:
        return 'التالي';
    }
  }
}
