import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productRepo) : super(ProductsInitial());
  final ProductRepo _productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _productRepo.getProducts();
    result.fold(
      (failuer) => emit(ProductsFailuer(errorMessage: failuer.message)),
      (products) => emit(ProducstSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await _productRepo.getBestSellingProducts();
    result.fold(
      (failuer) => emit(ProductsFailuer(errorMessage: failuer.message)),
      (products) => emit(ProducstSuccess(products: products)),
    );
  }
}
