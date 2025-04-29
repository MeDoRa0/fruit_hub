import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/products_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      // IndexedStack is a widget that allows you to display one child at a time based on the index
      // It is used to switch between different views in the app
      // without rebuilding the entire widget tree

      index: currentViewIndex,
      children: [
        HomeView(),
        ProductsView(),
        CartView(),
      ],
    );
  }
}
