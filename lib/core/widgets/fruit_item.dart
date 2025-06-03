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
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoritesFailure) {
          print('🔥 Favorites Error: ${state.errorMessage}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حصل خطأ: ${state.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final isFavorite = cubit.isFavorite(productEntity.code);

        return Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F5F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  productEntity.imageUrl != null
                      ? Flexible(
                          child: CustomNetworkImage(
                            imageUrl: productEntity.imageUrl!,
                          ),
                        )
                      : Container(
                          color: Colors.grey,
                          height: 100,
                          width: 100,
                        ),
                  const SizedBox(height: 24),
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
                            style: AppTextStyle.font13Bold.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: AppTextStyle.font13Bold.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: 'كيلو جرام',
                            style: AppTextStyle.font13Bold.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
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
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    print('Pressed favorite for ${productEntity.code}');
                    if (isFavorite) {
                      print('Removing favorite');
                      cubit.removeFavorite(productEntity.code);
                    } else {
                      print('Adding favorite');
                      cubit.addFavorite(productEntity.code);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
