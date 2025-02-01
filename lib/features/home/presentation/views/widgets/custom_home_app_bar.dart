import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_icon_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfile),
      title: Text(
        'مرحباً بك',
        style: AppTextStyle.font16Regular.copyWith(
          color: Color(0xFF949D9E),
        ),
      ),
      subtitle: Text(
        'محمد حسام',
        style: AppTextStyle.font16Bold,
      ),
      trailing: NotificationIconWidget(),
    );
  }
}
