import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failuers, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.fetchData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> productsEntities =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(productsEntities);
    } on Exception catch (e) {
      return Left(
        ServerFailuer(
          message: 'خطأ في جلب البيانات',
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.fetchData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> productsEntities =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(productsEntities);
    } on Exception catch (e) {
      return Left(
        ServerFailuer(
          message: 'خطأ في جلب البيانات',
        ),
      );
    }
  }
}