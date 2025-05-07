import 'package:fruit_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uID: orderEntity.uID,
      shippingAddressModel:
          ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'online',
    );
  }

  toJson() => {
        'totalPrice': totalPrice,
        'uID': uID,
        'status': 'pending',
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
}
