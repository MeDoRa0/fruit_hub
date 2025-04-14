import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/shipping_item.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key});

  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  int selectetdIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            selectetdIndex = 0;
            setState(() {});
          },
          isSelected: selectetdIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسلم من المكان',
          price: '40',
        ),
        SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            selectetdIndex = 1;
            setState(() {});
          },
          isSelected: selectetdIndex == 1,
          title: 'إدفع الان ',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
        ),
      ],
    );
  }
}
