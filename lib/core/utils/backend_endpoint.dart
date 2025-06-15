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
  static String isFavorite(String userId) => _favoritesPath(userId);

  static String cartPath(String userId) => 'users/$userId/cart';
  static String getCart(String userId) => cartPath(userId);
  static String addToCart(String userId) => cartPath(userId);
  static String deleteCartItem(String userId) => cartPath(userId);
  static String updateCartItem(String userId) => cartPath(userId);
}
