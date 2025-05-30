import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';
import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';

class FavoriteGridview extends StatelessWidget {
  const FavoriteGridview({super.key, required this.favoritesEntity, required this.products});
  final List<FavoriteEntity> favoritesEntity;
   final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: favoritesEntity.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
          
        );
      },
    );
  }
}
