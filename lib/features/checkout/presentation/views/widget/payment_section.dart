import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/order_summary_widget.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummaryWidget(),
        SizedBox(
          height: 16,
        ),
        ShippingAddressWidget(
          pageController: pageController,
        ),
      ],
    );
  }
}
