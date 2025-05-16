import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
  factory Details.fromEntity(OrderInputEntity orderEntity) => Details(
        subtotal:
            orderEntity.cartEntity.calculateTotalPrice().toStringAsFixed(2),
        shipping: orderEntity.calculateShippingCost().toStringAsFixed(2),
        shippingDiscount: orderEntity.calculateShippingDiscount(),
      );
}
