import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_netowk_image.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';

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
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              productEntity.imageUrl != null
                  ? Flexible(
                      child:
                          CustomNetworkImage(imageUrl: productEntity.imageUrl!),
                    )
                  : Container(
                      color: Colors.grey,
                      height: 100,
                      width: 100,
                    ),
              SizedBox(
                height: 24,
              ),
              ListTile(
                title: Text(
                  productEntity.name,
                  style: AppTextStyle.font13w600.copyWith(color: Colors.black),
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
                        text: 'كيلو جرام',
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
                    onPressed: () {
                      context.read<CartCubit>().addProductToCart(productEntity);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: BlocBuilder<FavoritesCubit, FavoriteState>(
              builder: (context, state) {
                bool isFavorite = false;
                if (state is FavoriteLoaded) {
                  isFavorite = state.favorites.contains(productEntity.productId);
                }
                return IconButton(
                  onPressed: () {
                    context.read<FavoritesCubit>().toggleFavorite(productEntity.productId);
                  },
                  icon: Icon(isFavorite? Icons.favorite : Icons.favorite_border, 
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
