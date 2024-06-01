import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/detailed_product/detailed_product.dart';
import 'package:ylham_motors/favorites/favorites.dart';
import 'package:ylham_motors/products/products.dart';

class DetailedProductContent extends StatelessWidget {
  const DetailedProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<DetailedProductCubit>().product;

    final properties = [
      if (product.id != null) ('id', product.id),
      if (product.rating != null) ('rating', product.rating),
      if (product.proportionalPrice != null) ('proportionalPrice', product.proportionalPrice),
      if (product.discountedPrice != null) ('discountedPrice', product.discountedPrice),
    ];

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(AppSpacing.md),
              ),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(AppSpacing.md),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? '',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, __, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress),
                  ),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            /// NAME
            Text(
              product.name ?? '',
              style: const AppTextStyle.text().lg().bold(),
            ),

            /// DESCRIPTION
            Text(
              product.description ?? '',
              style: const AppTextStyle.text().md().medium(),
            ),

            const SizedBox(height: AppSpacing.md),

            /// Price & actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    product.price ?? '',
                    style: const AppTextStyle.text().lg().bold(),
                  ),
                ),

                /// Actions
                Expanded(
                  flex: 10,
                  child: ProductActionButtons(
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
                  // child: ProductFooter(
                  //   onCart: () {},
                  //   onLike: () {},
                  // ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            /// Properties
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              clipBehavior: Clip.hardEdge,
              child: ColoredBox(
                color: Colors.blueGrey.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: properties.length,
                    separatorBuilder: (context, index) => const Divider(color: Colors.white),
                    itemBuilder: (context, index) {
                      final (String key, dynamic value) = properties[index];

                      return Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Text(
                              key,
                              style: const AppTextStyle.text().xs().semiBold(),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Text(
                              value.toString(),
                              style: const AppTextStyle.text().xs(),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

            ///GAP
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
