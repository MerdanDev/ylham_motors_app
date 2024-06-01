// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/favorites/favorites.dart';
import 'package:ylham_motors/products/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final ProductItem product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(
            imageUrl: product.image ?? '',
          ),

          // Content
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(product.name ?? '', style: const AppTextStyle.text().sm().semiBold()),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Text(
                    product.description ?? '',
                    style: const AppTextStyle.text().xs().medium(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(product.price ?? '', style: const AppTextStyle.text().md().bold()),
                    if (product.discountedPrice != null) ...[
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        product.discountedPrice?.toString() ?? '',
                        style: const AppTextStyle.text()
                            .sm()
                            .bold()
                            .withColor(Colors.grey.shade600)
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.sm),
          ProductActionButtons(
            productId: product.id!,
            quantity: context.select((CartBloc bloc) => bloc.getProductQuantity(product.id)),
            onFavoritePressed: () => context.read<FavoritesBloc>().add(FavoriteButtonPressed(product)),
            onQuantityUpdated: (quantity) {
              context.read<CartBloc>().add(
                    CartUpdateRequested(
                      CartUpdateRequestBody(
                        productId: product.id!,
                        quantity: quantity,
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    required this.imageUrl,
    this.borderRadius,
    super.key,
  });

  /// The aspect ratio of this image.
  static const _aspectRatio = 1.0;

  /// The url of this image.
  final String imageUrl;

  /// Border radius
  ///
  /// Default value is [BorderRadius.zero]
  final BorderRadius? borderRadius;

  static final defaultBorderRadius = BorderRadius.circular(AppSpacing.sm);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: borderRadius ?? defaultBorderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
