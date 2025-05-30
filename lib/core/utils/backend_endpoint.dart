class BackendEndpoint {
  static const addUserData = 'users';
  static const fetchUserData = 'users';
  static const isUserExist = 'users';
  static const getProducts = 'products';
  static const addOrder = 'orders';

  static String _favoritesPath(String userId) => 'users/$userId/favorites';

  static String addToFavorites(String userId) => _favoritesPath(userId);
  static String getFavorites(String userId) => _favoritesPath(userId);
  static String removeFromFavorites(String userId) => _favoritesPath(userId);
}
