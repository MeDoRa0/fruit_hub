import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/authentication/presentation/views/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widget/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color:
                currentPage == 1 ? AppColors.primaryColor : Color(0xFF5DB957),
            activeColor: AppColors.primaryColor,
          ),
        ),
        SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {
                // set the value of isOnBoardingViewSeen to true to prevent the user from seeing the onboarding view again
                SharedPreferencesSingleton.setBool(kIsOnBoardingViewSeen, true);

                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
          ),
        ),
        SizedBox(
          height: 43,
        )
      ],
    );
  }
}
