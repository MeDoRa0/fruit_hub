abstract class FavoritesRepo {
  Future<List<String>> getFavorites(String userId);
  Future<void> addFavorite(String userId, String productCode);
  Future<void> removeFavorite(String userId, String productCode);
  Future<bool> isFavorite(String userId, String productCode);
}
