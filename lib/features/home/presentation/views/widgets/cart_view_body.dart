import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          // Slivers are a type of scrollable area in Flutter
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: kVerticalPadding,
                  ),
                  buildAppBar(
                    context,
                    title: 'السلة',
                    showNotificationIcon: false,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CartHeader(),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                  ? CustomDivider()
                  : Container(),
            ),
            CartItemsList(
              cartItems: context.read<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                  ? CustomDivider()
                  : Container(),
            ),
          ],
        ),
        Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.07,
            child: CustomButton(
                text:
                    'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}  جنية',
                onPressed: () {})),
      ],
    );
  }
}
