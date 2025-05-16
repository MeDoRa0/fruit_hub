import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: 'عنوان التوصيل',
        child: Row(
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(
              width: 8,
            ),
            Text(
              '${context.read<OrderInputEntity>().shippingAddressEntity}',
              style: AppTextStyle.font13w400.copyWith(
                color: Color(0xFF4E5556),
              ),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.edit_location_alt_outlined, // or Icons.edit_outlined
                  size: 16,
                  color: Color(0xFF4E5556),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Text(
                    'التعديل',
                    style: AppTextStyle.font13w400.copyWith(
                      color: Color(0xFF4E5556),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
