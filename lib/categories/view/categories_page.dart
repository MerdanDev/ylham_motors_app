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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategoriyalar'),
      ),
      body: const CategoriesContent(),
    );
  }
}
