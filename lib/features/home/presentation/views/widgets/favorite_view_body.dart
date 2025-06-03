import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/favorites_gridview_bloc_builder.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: kVerticalPadding,
                ),
                buildAppBar(context, title: 'المفضلة', showBackButton: true),
                SizedBox(
                  height: kVerticalPadding,
                ),
              ],
            ),
          ),
          FavoritesGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
