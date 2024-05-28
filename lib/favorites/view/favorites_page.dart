import 'package:flutter/material.dart';
import 'package:ylham_motors/favorites/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FavoritesPage());
  }

  @override
  Widget build(BuildContext context) {
    return const FavoritesView();
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const FavoritesContent(),
    );
  }
}
