// ignore_for_file: lines_longer_than_80_chars

import 'package:ylham_motors_ui/ylham_motors_ui.dart' as food_ui;
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.navigationShell,
    super.key,
  });

  final int currentIndex;
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (int index) => _onTap(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryGray,
      selectedLabelStyle: const AppTextStyle.text().xs().semiBold().copyWith(color: AppColors.primary),
      unselectedLabelStyle: const AppTextStyle.text().medium().copyWith(color: AppColors.secondaryGray, fontSize: 11),
      items: [
        BottomNavigationBarItem(
          icon: widget.currentIndex == 0
              ? food_ui.Assets.icons.bottomNavIcons.navHouseSelected.svg()
              : food_ui.Assets.icons.bottomNavIcons.navHouse.svg(),
          // icon: Icon(widget.currentIndex == 0 ? Icons.house_rounded : Icons.house_outlined),
          // icon: SvgPicture.asset(
          //   widget.currentIndex == 0 ? FoodAssetIcons.bottomNavHouseSelected : FoodAssetIcons.bottomNavHouse,
          // ),
          label: 'Baş sahypa',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 1
              ? food_ui.Assets.icons.bottomNavIcons.navCategoriesSelected.svg()
              : food_ui.Assets.icons.bottomNavIcons.navCategories.svg(),
          // icon: Icon(widget.currentIndex == 1 ? Icons.category_rounded : Icons.category_outlined),
          // icon: SvgPicture.asset(
          //   widget.currentIndex == 1 ? FoodAssetIcons.bottomNavCategoriesSelected : FoodAssetIcons.bottomNavCategories,
          // ),
          label: 'Kategoriýa',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 2
              ? food_ui.Assets.icons.bottomNavIcons.navCartSelected.svg()
              : food_ui.Assets.icons.bottomNavIcons.navCart.svg(),
          // icon: Icon(widget.currentIndex == 2 ? Icons.shopping_cart_rounded : Icons.shopping_cart_outlined),
          // icon: SvgPicture.asset(
          //   widget.currentIndex == 2 ? FoodAssetIcons.bottomNavCartSelected : FoodAssetIcons.bottomNavCart,
          // ),
          label: 'Sebedim',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 3
              ? food_ui.Assets.icons.bottomNavIcons.navOrderSelected.svg()
              : food_ui.Assets.icons.bottomNavIcons.navOrder.svg(),
          // icon: Icon(widget.currentIndex == 3 ? Icons.shopping_bag_rounded : Icons.shopping_bag_outlined),
          // icon: SvgPicture.asset(
          //   widget.currentIndex == 3 ? FoodAssetIcons.bottomNavOrderSelected : FoodAssetIcons.bottomNavOrder,
          // ),
          label: 'Sargytlarym',
        ),
        BottomNavigationBarItem(
          icon: widget.currentIndex == 4
              ? food_ui.Assets.icons.bottomNavIcons.navUserSelected.svg()
              : food_ui.Assets.icons.bottomNavIcons.navUser.svg(),
          // icon: Icon(widget.currentIndex == 4 ? Icons.person_rounded : Icons.person_outlined),
          // icon: SvgPicture.asset(
          //   widget.currentIndex == 4 ? FoodAssetIcons.bottomNavUserSelected : FoodAssetIcons.bottomNavUser,
          // ),
          label: 'Profil',
        ),
      ],
    );
  }
}
