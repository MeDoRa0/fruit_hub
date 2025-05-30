import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorite_grid_view_bloc_builder.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
 

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: kVerticalPadding,
              ),
              buildAppBar(context, title: 'المفضلة', showBackButton: true),
              SizedBox(height: kVerticalPadding),
              FavoriteGridViewBlocBuilder()
            ],
          ),
        )
      ],
    );
  }
}
