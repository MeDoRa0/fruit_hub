import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_icon_widget.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: NotificationIconWidget(),
      )
    ],
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.font19Bold,
    ),
  );
}
