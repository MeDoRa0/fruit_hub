import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(PaypalPaymentEntity paymentEntity) {
    return PaypalPaymentEntity(
      amount: paymentEntity.amount,
      description: paymentEntity.description,
      itemList: paymentEntity.itemList,
    );
  }
}
