import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/authentication/presentation/views/widget/custom_checkbox.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCheckbox(
        isChecked: isTermsAccepted,
        onChecked: (value) {
          isTermsAccepted = value;
          widget.onChecked(isTermsAccepted);
          setState(() {});
        },
      ),
      SizedBox(
        width: 16,
      ),
      Expanded(
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: 'من خلال إنشاء حساب ، فإنك توافق على ',
            style: AppTextStyle.font13w600.copyWith(
              color: Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: 'الشروط والأحكام الخاصة بنا',
            style: AppTextStyle.font13w600.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          )
        ])),
      )
    ]);
  }
}
