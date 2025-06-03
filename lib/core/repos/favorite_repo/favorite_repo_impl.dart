import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
class FavoritesRepoImpl implements FavoritesRepo {
  final DatabaseService databaseService;

  FavoritesRepoImpl(this.databaseService);

  String favoritesPath(String userId) => 'users/$userId/favorites';

  @override
  Future<List<String>> getFavorites(String userId) async {
    final data = await databaseService.fetchData(path: favoritesPath(userId));
    return data.map<String>((e) => e['productCode'] as String).toList();
  }

  @override
  Future<void> addFavorite(String userId, String productCode) async {
    await databaseService.addData(
      path: favoritesPath(userId),
      data: {'productCode': productCode},
      docID: productCode,
    );
  }

  @override
  Future<void> removeFavorite(String userId, String productCode) async {
    await databaseService.deleteData(
      path: favoritesPath(userId),
      docID: productCode,
    );
  }

  @override
  Future<bool> isFavorite(String userId, String productCode) async {
    return databaseService.checkIfDataExists(
      path: favoritesPath(userId),
      docID: productCode,
    );
  }
}
