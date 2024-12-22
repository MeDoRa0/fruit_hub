import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesLeafTop),
          ],
        ),
        SvgPicture.asset(Assets.imagesSplashLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
