import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        // Slivers are a type of scrollable area in Flutter
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: kVerticalPadding,
                ),
                const CustomHomeAppBar(),
                SizedBox(
                  height: kVerticalPadding,
                ),
                SearchTextField(),
                SizedBox(
                  height: 12,
                ),
                FeaturedItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
