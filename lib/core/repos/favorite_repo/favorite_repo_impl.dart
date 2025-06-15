import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final DatabaseService databaseService;

  FavoritesRepoImpl(this.databaseService);

  @override
  Future<Either<Failuers, List<String>>> getFavorites(String userId) async {
    try {
      final data = await databaseService.fetchData(
          path: BackendEndpoint.getFavorites(userId));
      final favorites =
          data.map<String>((e) => e['productCode'] as String).toList();
      return right(favorites);
    } catch (e) {
      return left(ServerFailuer(message: 'Failed to fetch favorites: $e'));
    }
  }

  @override
  Future<Either<Failuers, Unit>> addFavorite(
      String userId, String productCode) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addToFavorites(userId),
        data: {'productCode': productCode},
        docID: productCode,
      );
      return right(unit);
    } catch (e) {
      return left(ServerFailuer(message: 'Failed to add favorite: $e'));
    }
  }

  @override
  Future<Either<Failuers, Unit>> removeFavorite(
      String userId, String productCode) async {
    try {
      await databaseService.deleteData(
        path: BackendEndpoint.removeFromFavorites(userId),
        docID: productCode,
      );
      return right(unit);
    } catch (e) {
      return left(ServerFailuer(message: 'Failed to remove favorite: $e'));
    }
  }

  @override
  Future<Either<Failuers, bool>> isFavorite(
      String userId, String productCode) async {
    try {
      final exists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isFavorite(userId),
        docID: productCode,
      );
      return right(exists);
    } catch (e) {
      return left(ServerFailuer(message: 'Failed to check favorite: $e'));
    }
  }
}
