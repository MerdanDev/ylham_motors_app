import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/products/products.dart';

class ProductsRefreshIndicator extends StatelessWidget {
  const ProductsRefreshIndicator({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final bloc = context.read<ProductsBloc>();
        bloc.add(ProductsRefreshRequested());
        while ((await bloc.stream.first).status == ProductsStatus.loading) {}
      },
      child: child,
    );
  }
}
