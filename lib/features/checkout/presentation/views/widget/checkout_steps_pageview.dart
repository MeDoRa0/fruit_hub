import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/address_input.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/shipping.dart';

class CheckOutStepsPageview extends StatelessWidget {
  const CheckOutStepsPageview({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      Shipping(),
      AddressInput(),
      SizedBox(),
      SizedBox(),
    ];
  }
}
