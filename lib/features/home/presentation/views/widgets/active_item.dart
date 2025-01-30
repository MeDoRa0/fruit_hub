import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.label, required this.icon});
  final String label, icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(icon)),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: AppTextStyle.font11SemiBoldW600
                  .copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
