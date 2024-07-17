// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/favorites/favorites.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/profile/profile.dart';

enum BottomNavigationBarItemType {
  home,
  category,
  cart,
  favorites,
  profile,
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const BottomNavBar());

  Map<BottomNavigationBarItemType, Widget> get pages => {
        BottomNavigationBarItemType.home: const HomePage(),
        BottomNavigationBarItemType.category: const CategoriesPage(),
        BottomNavigationBarItemType.cart: const CartPage(),
        BottomNavigationBarItemType.favorites: const FavoritesPage(),
        BottomNavigationBarItemType.profile: const ProfilePage(),
      };

  static final itemOrder = [
    BottomNavigationBarItemType.home,
    BottomNavigationBarItemType.category,
    BottomNavigationBarItemType.cart,
    BottomNavigationBarItemType.favorites,
    BottomNavigationBarItemType.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final currentType = context
        .select((AppCubit cubit) => cubit.state.currentBottomNavigationBarType);

    Map<BottomNavigationBarItemType, BottomNavigationBarItem> items = {
      BottomNavigationBarItemType.home: BottomNavigationBarItem(
        activeIcon: const Icon(Icons.home_rounded),
        icon: const Icon(Icons.home_outlined),
        label: context.l10n.home,
      ),
      BottomNavigationBarItemType.category: BottomNavigationBarItem(
        activeIcon: const Icon(Icons.category_rounded),
        icon: const Icon(Icons.category_outlined),
        label: context.l10n.category,
      ),
      BottomNavigationBarItemType.cart: BottomNavigationBarItem(
        activeIcon:
            const CartQuantityBadge(child: Icon(Icons.shopping_cart_rounded)),
        icon:
            const CartQuantityBadge(child: Icon(Icons.shopping_cart_outlined)),
        label: context.l10n.cart,
      ),
      BottomNavigationBarItemType.favorites: BottomNavigationBarItem(
        activeIcon: const Icon(Icons.favorite_rounded),
        icon: const Icon(Icons.favorite_border_rounded),
        label: context.l10n.favorites,
      ),
      BottomNavigationBarItemType.profile: BottomNavigationBarItem(
        activeIcon: const Icon(Icons.person_rounded),
        icon: const Icon(Icons.person_outlined),
        label: context.l10n.profile,
      ),
    };

    return Scaffold(
      body: pages[currentType],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: itemOrder.indexOf(currentType),
        onTap: (int index) {
          final item = itemOrder[index];

          if (item == BottomNavigationBarItemType.favorites) {
            context.read<FavoritesBloc>().add(FavoritesInitRequested());
          }

          context.read<AppCubit>().updateAppBottomNavigationBarItemType(item);
        },
        items:
            itemOrder.map<BottomNavigationBarItem>((e) => items[e]!).toList(),
      ),
    );
  }
}
