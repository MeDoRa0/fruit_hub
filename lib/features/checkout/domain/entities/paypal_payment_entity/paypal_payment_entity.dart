import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity orderEntity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'Payment description',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems),
    );
  }
  toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}
