import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';

abstract class FavoriteRepo {
  Future<Either<Failuers, void>> addProductToFavorite({
   required FavoriteEntity favoriteEntity, // هنا لو بتستخدم FavoriteEntity
  });

  Future<Either<Failuers, void>> removeProductFromFavorite({
    required FavoriteEntity favoriteEntity,
  });

  Future<Either<Failuers, List<FavoriteEntity>>> getFavorites({
    required String userId,       // هنا كمان لو جايب المفضلة حسب اليوزر
  });

   Future<Either<Failuers, List<ProductEntity>>> getFavoriteProductsByIds(
    List<String> productIds,
  );

 

}
