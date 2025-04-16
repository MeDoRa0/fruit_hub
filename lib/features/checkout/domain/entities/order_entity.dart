import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final bool? payWithCash;
  final ShippingAddressEntity? shippingAddressEntity;

  OrderEntity(this.cartEntity, {this.payWithCash, this.shippingAddressEntity});
}
