import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repos/order_repo/order_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  final OrderRepo orderRepo;

  void addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(orderEntity: order);
    result.fold(
      (failure) => emit(AddOrderFailure(message: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
