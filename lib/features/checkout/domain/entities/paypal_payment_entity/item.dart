import 'package:fruit_hub/core/helper_functions/get_currency.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
      factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) => ItemEntity(
        name: cartItemEntity.productEntity.name,
        quantity: cartItemEntity.quantity,
        price: cartItemEntity.productEntity.price.toStringAsFixed(2),
        currency: getCurrency(),
      );
}
