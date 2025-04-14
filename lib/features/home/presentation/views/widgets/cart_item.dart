
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_netowk_image.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      /// Listen to CartItemCubit to update the UI when cart item is updated
      buildWhen: (previous, current) {
        /// Check if the current state is CartItemUpdated and if the cart item entity is the same as the one passed to this widget
        if (current is CartItemUpdated) {
          /// Check if the current cart item entity is the same as the one passed to this widget
          if (current.cartItemEntity == cartItemEntity) {
            /// Return true to rebuild the widget
            return true;
          }
        }

        /// Return false to not rebuild the widget
        return false;
      },
      builder: (context, state) {
       
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!),
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(cartItemEntity.productEntity.name,
                            style: AppTextStyle.font16Bold),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCartItem(cartItemEntity);
                          },
                          child: SvgPicture.asset(
                            Assets.iconsTrash,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()}كيلو',
                      style: AppTextStyle.font13w400.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButton(
                          cartItemEntity: cartItemEntity,
                        ),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه',
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
      },
    );
  }
}
