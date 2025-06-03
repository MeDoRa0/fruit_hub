sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<String> favorites; // قائمة كودات المنتجات المفضلة
  FavoritesLoaded({required this.favorites});
}

final class FavoritesFailure extends FavoritesState {
  final String errorMessage;
  FavoritesFailure({required this.errorMessage});
}
