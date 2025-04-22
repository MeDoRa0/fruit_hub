import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widget/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب ',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyle.font13w400.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
              Spacer(),
              Text(
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font16SemiBold)
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text(
                ' التوصيل :',
                style: AppTextStyle.font13w400.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
              Spacer(),
              Text(
                '30 جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyle.font13w600.copyWith(
                  color: Color(0xFF4E5556),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Divider(
            color: Color(0xFFCACECE),
            thickness: 0.5,
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            children: [
              Text('الكلي', style: AppTextStyle.font16Bold),
              Spacer(),
              Text(
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                  textAlign: TextAlign.right,
                  style: AppTextStyle.font16Bold),
            ],
          ),
        ],
      ),
    );
  }
}
