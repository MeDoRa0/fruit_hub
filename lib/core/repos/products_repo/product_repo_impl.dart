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
  Future<Either<Failuers, List<ProductEntity>>> getBestSellingProducts() {}

  @override
  Future<Either<Failuers, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.fetchData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productsEntities =
          products.map((e) => e.toEntity()).toList();
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
