import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;
  final String userId;

  FavoritesCubit({required this.favoritesRepo, required this.userId})
      : super(FavoritesInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final favorites = await favoritesRepo.getFavorites(userId);
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addFavorite(String productCode) async {
    if (state is FavoritesLoaded) {
      final currentFavorites = (state as FavoritesLoaded).favorites;
      if (!currentFavorites.contains(productCode)) {
        try {
          await favoritesRepo.addFavorite(userId, productCode);
          final updatedFavorites = List<String>.from(currentFavorites)
            ..add(productCode);
          print('Updated favorites list: $updatedFavorites');
          emit(FavoritesLoaded(favorites: updatedFavorites));
        } catch (e) {
          emit(FavoritesFailure(errorMessage: e.toString()));
        }
      }
    }
  }

  Future<void> removeFavorite(String productCode) async {
    if (state is FavoritesLoaded) {
      final currentFavorites = (state as FavoritesLoaded).favorites;
      if (currentFavorites.contains(productCode)) {
        try {
          await favoritesRepo.removeFavorite(userId, productCode);
          final updatedFavorites = List<String>.from(currentFavorites)
            ..remove(productCode);
          print('Updated favorites list: $updatedFavorites');
          emit(FavoritesLoaded(favorites: updatedFavorites));
        } catch (e) {
          emit(FavoritesFailure(errorMessage: e.toString()));
        }
      }
    }
  }

  bool isFavorite(String productCode) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favorites.contains(productCode);
    }
    return false;
  }
}
