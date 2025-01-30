import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    //we use SliverGrid.builder to instend of GridView.builder to build it in CustomScrollView
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
