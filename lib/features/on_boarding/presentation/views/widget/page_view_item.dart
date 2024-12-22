import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title});
  final String image, backgroundImage, subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: Stack(
            children: [
              //Positioned.fill is used to fill the parent widget
              Positioned.fill(
                child: SvgPicture.asset(
                  Assets.imagesOnboardingBg1,
                  fit: BoxFit.fill,
                ),
              ),
              //Positioned is used to position the widget in the parent widget
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.imagesOnboardingImage1,
                ),
              ),
              Positioned(
                right: 30,
                top: 70,
                child: Text('تخطي'),
              )
            ],
          ),
        )
      ],
    );
  }
}
