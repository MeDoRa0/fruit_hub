 import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

AppBar buildAppBar(BuildContext context ,{required String title}) {
    return AppBar(
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