part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProducstSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProducstSuccess({required this.products});
}

final class ProductsFailuer extends ProductsState {
  final String errorMessage;
  ProductsFailuer({required this.errorMessage});
}
