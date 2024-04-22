import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/products/products.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({super.key});

  Widget _buildHeader(BuildContext context) {
    final category = context.read<ProductsBloc>().category;
    final brand = context.read<ProductsBloc>().brand;
    final headerText = [category?.name, brand?.name].nonNulls.join(' / ');

    if (headerText.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md).copyWith(bottom: 0),
          child: AppCard(
            child: Text(
              headerText,
              style: const AppTextStyle.text().xs().semiBold(),
            ),
          ),
        ),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    final (products, hasMoreContent) = context.select(
      (ProductsBloc bloc) => (bloc.state.products, bloc.state.hasMoreContent),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        /// ITEMS
        CustomScrollView(
          slivers: [
            _buildHeader(context),
            // _buildItems(context, products, hasMoreContent),
            ProductGridView(
              products: products,
              hasMoreContent: hasMoreContent,
              onLoadMore: () => context.read<ProductsBloc>().add(const ProductsRequested()),
            )
          ],
        ),

        /// EMPTY HANDLE
        if (products.isEmpty && !hasMoreContent) const ProductsEmpty(),
      ],
    );
  }
}
