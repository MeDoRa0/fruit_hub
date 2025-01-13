import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.logo,
    required this.onPressed,
  });
  final String label;
  final String logo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFDCDEDE), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          //visualDensity Reduces vertical space to the minimum.
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(logo),
          title: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyle.font16SemiBold.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
