import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failuers.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_input_entity.dart';

abstract class OrderRepo {
  Future<Either<Failuers, void>> addOrder(
      {required OrderInputEntity orderEntity});
}
