import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productsLength,
    this.onPressed,
  });

  final int productsLength;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (productsLength == 0) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverPadding(
      padding: const EdgeInsets.all(AppSpacing.md),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.51,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Product(
              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1682308249776-9356bf43b705?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YW5pbWV8ZW58MHx8MHx8fDA%3D",
              title: "block.title",
              onPressed: onPressed,
            );
          },
          childCount: productsLength,
        ),
      ),
    );
  }
}
