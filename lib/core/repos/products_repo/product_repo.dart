import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/errors/failuers.dart';

abstract class ProductRepo {
  Future<Either<Failuers, List<ProductEntity>>> getProducts();
  Future<Either<Failuers, List<ProductEntity>>> getBestSellingProducts();
}
