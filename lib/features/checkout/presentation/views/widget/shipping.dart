import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/shipping_item.dart';
import 'package:provider/provider.dart';

class Shipping extends StatefulWidget {
  const Shipping({super.key});

  @override
  State<Shipping> createState() => _ShippingState();
}

//AutomaticKeepAliveClientMixin is used to keep the state of the widget alive when it is not visible
class _ShippingState extends State<Shipping>
    with AutomaticKeepAliveClientMixin {
  int selectetdIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            selectetdIndex = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
          isSelected: selectetdIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: ' الدفع  عند استلام الطلب',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                  30)
              .toString(),
        ),
        SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            selectetdIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSelected: selectetdIndex == 1,
          title: 'إدفع الان ',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        ),
      ],
    );
  }

  /// This method is used to keep the state of the widget alive when it is not visible
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
