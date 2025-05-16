import 'package:fruit_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String orderId;

  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.orderId,
      required this.uID,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderId: Uuid().v4(),
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
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
        'orderId': orderId
      };
}
