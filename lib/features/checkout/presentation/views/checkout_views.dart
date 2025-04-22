import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutViews extends StatelessWidget {
  const CheckoutViews({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الشحن',
        showNotificationIcon: false,
      ),
      body: Provider.value(
        // Pass the cart items to the OrderEntity
        // and then to the CheckoutViewBody
        // This allows the CheckoutViewBody to access the cart items
        // through the OrderEntity
        // without needing to pass them directly
        value: OrderEntity(cartEntity,
            shippingAddressEntity: ShippingAddressEntity(), uID: getUser().uId),
        child: CheckoutViewBody(),
      ),
    );
  }
}
