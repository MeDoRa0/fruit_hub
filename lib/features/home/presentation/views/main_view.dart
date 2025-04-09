import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/products_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        //
        child: IndexedStack(
          // IndexedStack is a widget that allows you to display one child at a time based on the index
          // It is used to switch between different views in the app
          // without rebuilding the entire widget tree

          index: currentViewIndex,
          children: [
            HomeView(),
            ProductsView(),
            CartView(),
          ],
        ),
      ),
    );
  }
}
