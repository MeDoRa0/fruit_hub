import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/get_dummy_products.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteGridViewBlocBuilder extends StatelessWidget {
  const FavoriteGridViewBlocBuilder({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoriteState>(
      builder: (context, state) {
      if (state is FavoriteLoading) {
          return const CircularProgressIndicator(); // أو skeleton
        } else if (state is Favoritesuccess) {
          return FavoriteGridview(
            favoritesEntity: state.favorites,
            products: state.products,
          );
        } else if (state is FavoriteError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.message),
          );
        } else {
          return const SizedBox(); // Default safe fallback
        }
      },
    );
  }
}
