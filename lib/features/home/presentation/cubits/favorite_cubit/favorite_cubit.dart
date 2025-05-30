import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';
import 'favorite_state.dart'; // استورد الملف ده

class FavoritesCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoritesCubit(this.favoriteRepo) : super(FavoriteInitial());
  void toggleFavorite({required FavoriteEntity favoriteEntity}) async {
    final currentState = state;

    if (currentState is Favoritesuccess) {
      final currentFavorites = [...currentState.favorites];
      final currentProducts = [...currentState.products];

      final alreadyFavorite = currentFavorites.any(
        (fav) => fav.productId == favoriteEntity.productId,
      );

      // Update UI Optimistically
      if (alreadyFavorite) {
        currentFavorites
            .removeWhere((fav) => fav.productId == favoriteEntity.productId);
        currentProducts.removeWhere(
          (prod) => prod.productId == favoriteEntity.productId,
        );
      } else {
        currentFavorites.add(favoriteEntity);
        // fetch the single product to add to products list
        final productResult = await favoriteRepo
            .getFavoriteProductsByIds([favoriteEntity.productId]);
        productResult.fold(
          (failure) => emit(FavoriteError(failure.message)),
          (newProducts) => currentProducts.addAll(newProducts),
        );
      }
      emit(Favoritesuccess(currentFavorites, currentProducts));

      // Real operation
      final result = alreadyFavorite
          ? await favoriteRepo.removeProductFromFavorite(
              favoriteEntity: favoriteEntity)
          : await favoriteRepo.addProductToFavorite(
              favoriteEntity: favoriteEntity);

      result.fold(
        (failure) => emit(FavoriteError(failure.message)),
        (_) async {
          final updatedFavorites = await favoriteRepo.getFavorites(
            userId: favoriteEntity.userId,
          );
          updatedFavorites.fold(
            (failure) => emit(FavoriteError(failure.message)),
            (favorites) async {
              final productIds = favorites.map((f) => f.productId).toList();

              final productResult =
                  await favoriteRepo.getFavoriteProductsByIds(productIds);
              productResult.fold(
                (failure) => emit(FavoriteError(failure.message)),
                (products) => emit(Favoritesuccess(favorites, products)),
              );
            },
          );
        },
      );
    }
  }

  void loadFavorites(String userId) async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.getFavorites(userId: userId);
    result.fold((failure) => emit(FavoriteError(failure.message)),
        (favorites) async {
      final productId = favorites.map((e) => e.productId).toList();
      final productResult =
          await favoriteRepo.getFavoriteProductsByIds(productId);
      productResult.fold(
        (failure) => emit(FavoriteError(failure.message)),
        (products) => emit(Favoritesuccess(favorites, products)),
      );
    });
  }
}
