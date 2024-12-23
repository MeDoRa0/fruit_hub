import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widget/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          //  key: ValueKey('page1'),
          image: Assets.imagesOnboardingImage1,
          backgroundImage: Assets.imagesOnboardingBg1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' مرحبًا بك في',
                style: AppTextStyle.font23Bold,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'HUB',
                style: AppTextStyle.font23Bold.copyWith(
                  color: Color(0xFFF4A91F),
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyle.font23Bold.copyWith(
                  color: Color(0xFF1B5E37),
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          // key: ValueKey('page2'),
          image: Assets.imagesOnboardingImage2,
          backgroundImage: Assets.imagesOnboardingBg2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث و تسوق',
                style: AppTextStyle.font23Bold,
              ),
            ],
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
