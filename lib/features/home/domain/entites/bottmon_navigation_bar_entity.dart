import 'package:fruit_hub/core/utils/assets.dart';

class BottmonNavigationBarEntity {
  final String activeIcon, inActiveIcon, label;

  BottmonNavigationBarEntity(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.label});
}

List<BottmonNavigationBarEntity> get bottomNavigationBarItems => [
      BottmonNavigationBarEntity(
          activeIcon: Assets.iconsHomeFill,
          inActiveIcon: Assets.iconsHome,
          label: 'الرئيسية'),
      BottmonNavigationBarEntity(
          activeIcon: Assets.iconsProductsFill,
          inActiveIcon: Assets.iconsProducts,
          label: 'المنتجات'),
      BottmonNavigationBarEntity(
          activeIcon: Assets.iconsShoppingCartFill,
          inActiveIcon: Assets.iconsShoppingCart,
          label: 'سلة التسوق'),
      BottmonNavigationBarEntity(
        activeIcon: Assets.iconsProfileFill,
        inActiveIcon: Assets.iconsProfile,
        label: 'حسابي',
      ),
    ];
