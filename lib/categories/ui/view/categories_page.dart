import 'package:flutter/material.dart';
import 'package:ylham_motors/categories/categories.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesView();
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kategoriyalar'),
          bottom: const TabBar(
            tabs: [
              // Tab(icon: PhosphorIcon(PhosphorIconsBold.circlesFour)),
              Tab(text: "Categories"),
              Tab(text: "Brands"),
            ],
          ),
        ),
        body: const CategoriesContent(),
      ),
    );
  }
}
