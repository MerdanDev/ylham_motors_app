import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/products/products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    this.category,
    this.brand,
  });

  final CategoryItem? category;
  final BrandItem? brand;

  static Route<void> route({
    CategoryItem? category,
    BrandItem? brand,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductsPage(
        category: category,
        brand: brand,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc(
        productRepository: context.read<ProductRepository>(),
        category: category,
        brand: brand,
      )..add(const ProductsRequested()),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: const ProductsContent(),
    );
  }
}
