import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'favorite_state.dart'; // استورد الملف ده

class FavoritesCubit extends Cubit<FavoriteState> {
  final FirestoreService firestoreService;
  final String userId;

  FavoritesCubit({
    required this.firestoreService,
    required this.userId,
  }) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    try {
      emit(FavoriteLoading());
      final favorites = await firestoreService.getFavorites(userId);
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError('فشل تحميل المفضلة'));
    }
  }

  Future<void> toggleFavorite(String productId) async {
    if (state is! FavoriteLoaded) return;

    try {
      final currentFavorites = List<String>.from((state as FavoriteLoaded).favorites);

      if (currentFavorites.contains(productId)) {
        currentFavorites.remove(productId);
      } else {
        currentFavorites.add(productId);
      }

      emit(FavoriteLoaded(currentFavorites)); // local update first
      await firestoreService.toggleFavorite(userId: userId, productId: productId);
    } catch (e) {
      emit(FavoriteError('فشل تعديل المفضلة'));
    }
  }

  bool isFavorite(String productId) {
    if (state is FavoriteLoaded) {
      return (state as FavoriteLoaded).favorites.contains(productId);
    }
    return false;
  }
}
