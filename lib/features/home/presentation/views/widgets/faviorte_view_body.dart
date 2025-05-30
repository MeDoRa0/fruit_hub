import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {

  @override
  void initState() {
   
    super.initState();
    context.read<FavoritesCubit>().loadFavorites(FirebaseAuth.instance.currentUser!.uid);

  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: kVerticalPadding,),
              buildAppBar(context, title: 'المفضلة', showBackButton: true),
              SizedBox(height: kVerticalPadding ),
            FavoriteGridViewBlocBuilder()
            ],
          ),
        )
      ],
    );
  }
}
