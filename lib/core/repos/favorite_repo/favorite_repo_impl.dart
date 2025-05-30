import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/home/data/models/favorite_model.dart';
import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final DatabaseService databaseService;

  FavoriteRepoImpl(this.databaseService);

  @override
  Future<Either<Failuers, void>> addProductToFavorite(
      {required FavoriteEntity favoriteEntity}) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addToFavorites(favoriteEntity.userId),
        docID: favoriteEntity.productId,
        data: FavoriteModel.fromEntity(favoriteEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, List<FavoriteEntity>>> getFavorites({
    required String userId,
  }) async {
    try {
      final data = await databaseService.fetchData(
        path: BackendEndpoint.getFavorites(
            userId), // جبت البيانات من المسار الصحيح
      );

      // تأكد إن البيانات List
      final List<FavoriteEntity> favorites =
          (data as List<dynamic>).map<FavoriteEntity>((e) {
        return FavoriteModel.fromJson(e).toEntity();
      }).toList();

      return Right(favorites);
    } catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, void>> removeProductFromFavorite(
      {required FavoriteEntity favoriteEntity}) async {
    try {
      await databaseService.deleteData(
        path: BackendEndpoint.removeFromFavorites(favoriteEntity.userId),
        docID: favoriteEntity.productId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }
}
