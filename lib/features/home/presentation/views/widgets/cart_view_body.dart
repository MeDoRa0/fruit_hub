import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
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
              child: CustomDivider(),
            ),
            CartItemsList(),
            SliverToBoxAdapter(
              child: CustomDivider(),
            ),
          ],
        ),
        Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.07,
            child: CustomButton(text: 'الدفع 120 جنية', onPressed: () {})),
      ],
    );
  }
}
