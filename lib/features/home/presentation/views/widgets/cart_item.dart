import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_netowk_image.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              imageUrl:
                  'https://msfb.org/wp-content/uploads/2023/06/Placeholder_view_vector.svg.png',
            ),
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('تفاح', style: AppTextStyle.font16Bold),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.iconsTrash,
                      ),
                    ),
                  ],
                ),
                Text(
                  '3 كيلو',
                  style: AppTextStyle.font13w400.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButton(),
                    Spacer(),
                    Text(
                      '60 جنيه',
                      style: AppTextStyle.font16Bold.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
