import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
