import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    required this.uID,
    this.payWithCash,
    required this.shippingAddressEntity,
  });

  double calculateShippingCost() {
    if (payWithCash == true) {
      return 20;
    } else {
      return 30;
    }
  }
  double calculateShippingDiscount() {
    if (cartEntity.calculateTotalPrice() > 100) {
      return 10;
    } else {
      return 0;
    }
  }
  double calculateFinalTotalPrice() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

 
}
