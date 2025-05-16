import 'package:fruit_hub/core/helper_functions/get_currency.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderInputEntity orderEntity) => Amount(
        total: orderEntity.calculateFinalTotalPrice().toString(),
        currency: getCurrency(),
        details: Details.fromEntity(orderEntity),
      );

  toJson() => {
        'total': total,
        'currency': currency,
        'details': details!.toJson(),
      };
}
