import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ylham_motors/products/products.dart';

class CategoriesItemCard extends StatelessWidget {
  const CategoriesItemCard({
    super.key,
    required this.category,
  });

  final CategoryItem category;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onPressed: () {
        Navigator.of(context).push(
          ProductsPage.route(
            category: category,
          ),
        );
      },
      // padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.xs),
            child: SizedBox.square(
              dimension: 30,
              child: CachedNetworkImage(
                imageUrl: category.image ?? '',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              category.name ?? '',
              style: const AppTextStyle.text().md().semiBold(),
            ),
          ),
          const PhosphorIcon(PhosphorIconsBold.caretRight, size: 20),
          const SizedBox(width: AppSpacing.sm),
        ],
      ),
    );
  }
}
