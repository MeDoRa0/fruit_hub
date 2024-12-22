import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widget/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesOnboardingImage1,
          backgroundImage: Assets.imagesOnboardingBg1,
          title: Row(
            children: [
              Text('مرحبًا بك في'),
              Text('Fruit'),
              Text('HUB'),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
      ],
    );
  }
}
