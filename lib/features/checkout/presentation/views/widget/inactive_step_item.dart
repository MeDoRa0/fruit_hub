import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({
    super.key,
    required this.index,
    required this.text,
  });
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.disabledColor,
          child: Text(
            index,
            style: AppTextStyle.font13Bold.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyle.font13w600
              .copyWith(color: AppColors.disabeldTextColor),
        ),
      ],
    );
  }
}
