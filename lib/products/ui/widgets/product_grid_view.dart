import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';
import 'package:ylham_motors/products/products.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    required this.products,
    this.hasMoreContent = false,
    this.onLoadMore,
    super.key,
  });

  final List<ProductItem> products;
  final bool hasMoreContent;
  final VoidCallback? onLoadMore;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.md),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.51,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
        ),
        itemCount: products.length + (hasMoreContent ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == products.length) {
            onLoadMore?.call();

            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const AppCard(child: SizedBox()),
            );
          }

          return ProductCard(
            product: products[index],
            onPressed: () {
              Navigator.of(context).push(
                DetailedProductPage.route(
                  product: products[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
