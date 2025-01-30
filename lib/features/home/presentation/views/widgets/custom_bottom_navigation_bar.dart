import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        
      ),
    );
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem()
        : InActiveItem(
            icon: Assets.iconsHome,
          );
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
