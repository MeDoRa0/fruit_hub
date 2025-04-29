import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});


  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
  factory Details.fromEntity(OrderEntity orderEntity) => Details(
        subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
        shipping: orderEntity.calculateShippingCost().toString(),
        shippingDiscount: orderEntity.calculateShippingDiscount().toInt(),
      );
}
