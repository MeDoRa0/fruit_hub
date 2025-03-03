import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.network(productEntity.imageUrl!),
                SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style:
                        AppTextStyle.font13w600.copyWith(color: Colors.black),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${productEntity.price} جنية ',
                          style: AppTextStyle.font13Bold
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyle.font13Bold
                              .copyWith(color: AppColors.lightSecondaryColor),
                        ),
                        TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: ' ${productEntity.unitAmount}',
                          style: AppTextStyle.font13Bold
                              .copyWith(color: AppColors.lightSecondaryColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
