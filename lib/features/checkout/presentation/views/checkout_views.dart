import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/add_order_cubit_blocbuilder.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/checkout_view_body.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutViews extends StatefulWidget {
  const CheckoutViews({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutViews> createState() => _CheckoutViewsState();
}

class _CheckoutViewsState extends State<CheckoutViews> {
  late OrderInputEntity orderEntity;
  @override
  void initState() {
    super.initState();

    // Get user ID safely
    String userId = '';
    try {
      userId = getUser().uId;
    } catch (e) {
      // If user data is not available, this might cause issues
      // but the checkout process should not proceed without a valid user
      print('Error getting user ID: $e');
    }

    orderEntity = OrderInputEntity(widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity(), uID: userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrderRepo>(),
      ),
      child: Scaffold(
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
          value: orderEntity,
          child: AddOrderCubitBlocbuilder(
            child: CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}
