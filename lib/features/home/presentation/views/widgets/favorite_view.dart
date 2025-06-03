import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_view_body.dart';

class FavoritesView extends StatelessWidget {
  static const String routeName = 'favorites';
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        favoritesRepo: getIt<FavoritesRepo>(),
        userId: getIt<FirebaseAuthService>().currentUser!.uid,
      )..loadFavorites(),
      child: const Scaffold(
        body: FavoritesViewBody(),
      ),
    );
  }
}
