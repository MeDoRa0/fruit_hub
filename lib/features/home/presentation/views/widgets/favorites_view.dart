import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/favorite_repo/favorite_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/faviorte_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static const String routeName = 'favorites_view';

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Center(child: Text("برجاء تسجيل الدخول أولًا"));
    }

    return BlocProvider(
      create: (context) =>
          FavoritesCubit(getIt.get<FavoriteRepo>())..loadFavorites(userId),
      child: FavoriteViewBody(),
    );
  }
}
