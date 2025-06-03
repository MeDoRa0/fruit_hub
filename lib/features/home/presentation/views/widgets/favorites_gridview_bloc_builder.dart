import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/helper_functions/get_dummy_products.dart';
import 'package:fruit_hub/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorites_gridview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesGridViewBlocBuilder extends StatelessWidget {
  const FavoritesGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          final favoritesCodes = state.favorites;

          return FutureBuilder<List<ProductEntity>>(
            future: _fetchFavoriteProducts(context, favoritesCodes),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer.sliver(
                  child: FavoritesGridView(products: getDummyProducts()),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child:
                      Center(child: Text('لم تقم بإضافة أي منتج للمفضلة بعد')),
                );
              } else {
                return FavoritesGridView(products: snapshot.data!);
              }
            },
          );
        } else if (state is FavoritesLoading) {
          return Skeletonizer.sliver(
            child: FavoritesGridView(products: getDummyProducts()),
          );
        } else if (state is FavoritesFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${state.errorMessage}')),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }

  Future<List<ProductEntity>> _fetchFavoriteProducts(
      BuildContext context, List<String> codes) async {
    final productRepo = getIt<ProductRepo>();
    final result = await productRepo.getProducts();

    return result.fold(
      (failure) => [],
      (products) => products.where((p) => codes.contains(p.code)).toList(),
    );
  }
}
