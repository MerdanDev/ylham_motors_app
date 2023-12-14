import 'package:flutter/material.dart';

class NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavAppBar({this.title, super.key});

  final Widget? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text("App Rider"),
    );
  }
}
