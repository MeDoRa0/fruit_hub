import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entites/bottmon_navigation_bar_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottmonNavigationBarEntity});
  final bool isSelected;
  final BottmonNavigationBarEntity bottmonNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem()
        : InActiveItem(
            icon: bottmonNavigationBarEntity.inActiveIcon,
          );
  }
}