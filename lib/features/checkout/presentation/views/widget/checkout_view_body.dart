import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub/core/utils/app_keys.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_hub/features/checkout/manager/add_order_cubit/add_order_cubit.dart';
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
  // This method is used to initialize the page controller and listen to its changes

  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
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
    valueNotifier.dispose();
    super.dispose();
  }

  int currentStepIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            onTap: (index) {
              if (currentStepIndex == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderInputEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(),
                      content: Text('يرجي تحديد طريقه الدفع'),
                    ),
                  );
                }
              } else {
                _handelAdressValidation();
              }
            },
            currentStepIndex: currentStepIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckOutStepsPageview(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: formKey,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentStepIndex),
            onPressed: () {
              if (currentStepIndex == 0) {
                _handleShippingValidation(context);
              } else if (currentStepIndex == 1) {
                _handelAdressValidation();
              } else {
                _proccessPayment(context);
              }
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  void _handleShippingValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
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

  void _handelAdressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _proccessPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    log("🧾 PAYPAL TRANSACTION DATA: ${paypalPaymentEntity.toJson()}");
    //log(paypalPaymentEntity.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: AppKeys.kPayPalClientId,
        secretKey: AppKeys.kPayPalSecretKey,
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          addOrderCubit.addOrder(order: orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          // log(error.toString());
          log(" PayPal Payment Error: $error");
          buildErrorBar(context, error.toString());
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
