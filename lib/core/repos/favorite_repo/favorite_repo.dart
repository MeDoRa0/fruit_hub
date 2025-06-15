import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
abstract class FavoritesRepo {
  Future<Either<Failuers, List<String>>> getFavorites(String userId);
  Future<Either<Failuers, Unit>> addFavorite(String userId, String productCode);
  Future<Either<Failuers, Unit>> removeFavorite(String userId, String productCode);
  Future<Either<Failuers, bool>> isFavorite(String userId, String productCode);
}
