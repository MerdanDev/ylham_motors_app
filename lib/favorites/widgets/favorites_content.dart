import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/favorites/favorites.dart';
import 'package:ylham_motors/products/products.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final (
      products,
      hasMoreContent,
    ) = context.select(
      (FavoritesBloc bloc) => (
        bloc.state.products,
        bloc.state.hasMoreContent,
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        /// ITEMS
        CustomScrollView(
          slivers: [
            ProductGridView(
              products: products,
              hasMoreContent: hasMoreContent,
              onLoadMore: () => context.read<FavoritesBloc>().add(FavoritesRequested()),
            )
          ],
        ),

        /// EMPTY HANDLE
        if (products.isEmpty && !hasMoreContent) const ProductsEmpty(),
      ],
    );
  }
}
