import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/authentication/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.isVisable});
  final String image, backgroundImage, subTitle;
  final Widget title;
  final bool isVisable;

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
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              //Positioned is used to position the widget in the parent widget
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisable,
                child: Positioned(
                  right: 30,
                  top: 70,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text(
                      'تخطي',
                      style: AppTextStyle.font13w400.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 301,
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.font13w600.copyWith(
              height: 1.7,
              color: Color(0xFF4E5456),
            ),
          ),
        ),
      ],
    );
  }
}
