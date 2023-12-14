import 'package:ylham_motors/navigation/navigation.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootView extends StatelessWidget {
  const RootView({
    required this.children,
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: children[navigationShell.currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        navigationShell: navigationShell,
      ),
    );
  }
}
