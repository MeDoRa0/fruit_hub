import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/home/domain/repository/cart_repo.dart';
import 'package:fruit_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_view_body.dart';

class FavoritesView extends StatelessWidget {
  static const String routeName = 'favorites';
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = getIt<FirebaseAuthService>();
    final currentUser = firebaseAuthService.currentUser;

    if (currentUser == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'يرجى تسجيل الدخول للوصول إلى المفضلة',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoritesCubit(
            favoritesRepo: getIt<FavoritesRepo>(),
            userId: currentUser.uid,
          )..loadFavorites(),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            cartRepo: getIt<CartRepo>(),
            firebaseAuthService: firebaseAuthService,
          ),
        ),
      ],
      child: const Scaffold(
        body: FavoritesViewBody(),
      ),
    );
  }
}
