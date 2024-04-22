import 'package:flutter/material.dart';
import 'package:ylham_motors/brands/brands.dart';
import 'package:ylham_motors/categories/categories.dart';

class CategoriesContent extends StatelessWidget {
  const CategoriesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        CategoryListView(),
        BrandsGridView(),
      ],
    );
  }
}
