import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';

class DetailedProductPage extends StatelessWidget {
  const DetailedProductPage({
    super.key,
    required this.product,
  });

  static Route<void> route({
    required ProductItem product,
  }) =>
      MaterialPageRoute<void>(
        builder: (_) => DetailedProductPage(product: product),
      );

  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailedProductCubit(product: product),
      child: const DetailedProductView(),
    );
  }
}

class DetailedProductView extends StatelessWidget {
  const DetailedProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<DetailedProductCubit>().product.name ?? ''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: const DetailedProductContent(),
    );
  }
}
