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

    final alreadyFavorite = currentFavorites.any(
      (fav) => fav.productId == favoriteEntity.productId,
    );

    // Update UI Optimistically
    if (alreadyFavorite) {
      currentFavorites.removeWhere((fav) => fav.productId == favoriteEntity.productId);
    } else {
      currentFavorites.add(favoriteEntity);
    }
    emit(Favoritesuccess(currentFavorites));

    // Real operation
    final result = alreadyFavorite
        ? await favoriteRepo.removeProductFromFavorite(favoriteEntity: favoriteEntity)
        : await favoriteRepo.addProductToFavorite(favoriteEntity: favoriteEntity);

    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (_) async {
        final updatedFavorites = await favoriteRepo.getFavorites(
          userId: favoriteEntity.userId,
        );
        updatedFavorites.fold(
          (failure) => emit(FavoriteError(failure.message)),
          (favorites) => emit(Favoritesuccess(favorites)),
        );
      },
    );
  }
}


  void loadFavorites(String userId) async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.getFavorites(userId: userId);
    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (favorites) => emit(Favoritesuccess(favorites)),
    );
  }
}
