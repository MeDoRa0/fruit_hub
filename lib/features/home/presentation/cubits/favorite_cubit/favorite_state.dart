import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class Favoritesuccess extends FavoriteState {
  final List<FavoriteEntity> favorites;

  Favoritesuccess(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
