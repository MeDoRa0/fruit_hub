import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/home/data/models/cart_model.dart';
import 'package:fruit_hub/features/home/domain/entites/cart_entity.dart';
import 'package:fruit_hub/features/home/domain/repository/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final DatabaseService databaseService;

  CartRepoImpl({required this.databaseService});

  @override
  Future<Either<Failuers, void>> addToCart(
      String userId, CartEntity cart) async {
    try {
      dev.log('Adding cart to Firebase for user: $userId');
      final cartModel = CartModel.fromEntity(cart);
      final exists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.cartPath(userId),
        docID: userId,
      );

      if (exists) {
        dev.log('Updating existing cart');
        await databaseService.updateData(
          path: BackendEndpoint.cartPath(userId),
          data: cartModel.toJson(),
          docID: userId,
        );
      } else {
        dev.log('Creating new cart');
        await databaseService.addData(
          path: BackendEndpoint.cartPath(userId),
          data: cartModel.toJson(),
          docID: userId,
        );
      }
      dev.log('Cart operation successful');
      return const Right(null);
    } on Exception catch (e) {
      dev.log('Error in addToCart: $e');
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, CartEntity>> getCart(String userId) async {
    try {
      dev.log('Fetching cart for user: $userId');
      final data = await databaseService.fetchData(
        path: BackendEndpoint.cartPath(userId),
      ) as List<Map<String, dynamic>>;

      if (data.isEmpty) {
        dev.log('No cart found, returning empty cart');
        return Right(CartEntity([]));
      }

      dev.log('Cart data found: ${data.first}');
      final cartModel = CartModel.fromJson(data.first);
      return Right(cartModel.toEntity());
    } on Exception catch (e) {
      dev.log('Error in getCart: $e');
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, void>> updateCart(
      String userId, CartEntity cart) async {
    try {
      dev.log('Updating cart for user: $userId');
      final cartModel = CartModel.fromEntity(cart);
      await databaseService.updateData(
        path: BackendEndpoint.cartPath(userId),
        data: cartModel.toJson(),
        docID: userId,
      );
      dev.log('Cart update successful');
      return const Right(null);
    } on Exception catch (e) {
      dev.log('Error in updateCart: $e');
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuers, void>> deleteCart(String userId) async {
    try {
      dev.log('Deleting cart for user: $userId');
      await databaseService.deleteData(
        path: BackendEndpoint.cartPath(userId),
        docID: userId,
      );
      dev.log('Cart deletion successful');
      return const Right(null);
    } on Exception catch (e) {
      dev.log('Error in deleteCart: $e');
      return Left(ServerFailuer(message: e.toString()));
    }
  }
}
