import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: itemWidth * 0.5,
                child: Image.asset(
                  Assets.imagesFruitTest,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: svg.Svg(Assets.imagesFeaturedItemBg),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Opacity(
                        opacity: 0.80,
                        child: Text(
                          'عروض العيد',
                          style: AppTextStyle.font13w400
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: AppTextStyle.font19Bold
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      FeaturedItemButton(onPressed: () {}),
                      SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
