import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class CheckoutViews extends StatelessWidget {
  const CheckoutViews({super.key, required this.cartItems});
  static const String routeName = 'checkout';
 final  List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الشحن',
        showNotificationIcon: false,
      ),
      body: CheckoutViewBody(),
    );
  }
}
