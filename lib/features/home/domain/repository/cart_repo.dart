import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failuers, void>> addToCart(String userId, CartEntity cart);
  Future<Either<Failuers, CartEntity>> getCart(String userId);
  Future<Either<Failuers, void>> updateCart(String userId, CartEntity cart);
  Future<Either<Failuers, void>> deleteCart(String userId);
}
