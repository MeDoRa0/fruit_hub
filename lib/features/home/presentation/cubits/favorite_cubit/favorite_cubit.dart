import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;
  final String userId;
  List<String> _favorites = [];

  FavoritesCubit({required this.favoritesRepo, required this.userId})
      : super(FavoritesInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    final result = await favoritesRepo.getFavorites(userId);
    result.fold(
      (failure) => emit(FavoritesFailure(errorMessage: failure.message)),
      (favorites) {
        _favorites = favorites;
        emit(FavoritesLoaded(favorites: favorites));
      },
    );
  }

  Future<void> addFavorite(String productCode) async {
    if (state is FavoritesLoaded) {
      final currentFavorites = (state as FavoritesLoaded).favorites;
      if (!currentFavorites.contains(productCode)) {
        final result = await favoritesRepo.addFavorite(userId, productCode);
        result.fold(
          (failure) => emit(FavoritesFailure(errorMessage: failure.message)),
          (_) {
            _favorites = List<String>.from(currentFavorites)..add(productCode);
            emit(FavoritesLoaded(favorites: _favorites));
          },
        );
      }
    } else {
      // If not in loaded state, try to load favorites first
      await loadFavorites();
      // Then try to add the favorite
      if (state is FavoritesLoaded) {
        await addFavorite(productCode);
      }
    }
  }

  Future<void> removeFavorite(String productCode) async {
    if (state is FavoritesLoaded) {
      final currentFavorites = (state as FavoritesLoaded).favorites;
      if (currentFavorites.contains(productCode)) {
        final result = await favoritesRepo.removeFavorite(userId, productCode);
        result.fold(
          (failure) => emit(FavoritesFailure(errorMessage: failure.message)),
          (_) {
            _favorites = List<String>.from(currentFavorites)
              ..remove(productCode);
            emit(FavoritesLoaded(favorites: _favorites));
          },
        );
      }
    } else {
      // If not in loaded state, try to load favorites first
      await loadFavorites();
      // Then try to remove the favorite
      if (state is FavoritesLoaded) {
        await removeFavorite(productCode);
      }
    }
  }

  bool isFavorite(String productCode) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favorites.contains(productCode);
    }
    // If not in loaded state, use the cached favorites
    return _favorites.contains(productCode);
  }
}
