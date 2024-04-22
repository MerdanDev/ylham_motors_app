// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/products/products.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({
    required this.quantity,
    required this.onFavoritePressed,
    required this.onQuantityUpdated,
    Key? key,
  }) : super(key: key);

  final int quantity;
  final VoidCallback onFavoritePressed;
  final QuantityUpdateCallback onQuantityUpdated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.outlined(
          onPressed: () => onFavoritePressed(),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.sm), // <-- Radius
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: const Icon(Icons.favorite_border_rounded, size: 20),
        ),

        const SizedBox(width: AppSpacing.sm),

        // Add to cart icon button
        Expanded(
          child: quantity == 0
              ? AppButton.icon(
                  onPressed: () => onQuantityUpdated(1),
                  icon: const Icon(Icons.shopping_cart_rounded),
                )
              : ProductQuantityCounter(
                  quantity: quantity,
                  onQuantityUpdated: onQuantityUpdated,
                ),
        ),
      ],
    );
  }
}
