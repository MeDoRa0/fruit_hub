import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/active_shipping_item_dot.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xFF949D9E) /* Grayscale-400 */,
                    ),
                  ),
                ),
                child: isSelected
                    ? const ActiveShippingItemDot()
                    : const InActiveShippingItemDot(),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        AppTextStyle.font13w600.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font13w400.copyWith(
                      color: Color(0xFF7B7B7B),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: AppTextStyle.font13Bold
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
