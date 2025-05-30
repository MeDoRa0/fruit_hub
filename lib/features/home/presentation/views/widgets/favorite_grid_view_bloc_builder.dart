import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/faviorte_view_body.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoriteGridViewBlocBuilder extends StatelessWidget {
  const FavoriteGridViewBlocBuilder({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return Skeletonizer(
            child: const FavoriteViewBody(),
          );
        } else if (state is FavoriteError) {
          return Center(
            child: Text('Error loading favorites: ${state.message}'),
          );
        } else {
          return FavoriteViewBody();
        }
      },
    );
  }
}
