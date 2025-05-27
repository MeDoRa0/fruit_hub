import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl(this.databaseService);
  @override
  Future<Either<Failuers, void>> addOrder(
      {required OrderInputEntity orderEntity}) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addOrder,
          docID: null,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }
}
