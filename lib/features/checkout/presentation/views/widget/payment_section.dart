import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummaryWidget(),
      ],
    );
  }
}
