// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors/products/products.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({
    required this.quantity,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onQuantityUpdated,
    Key? key,
  }) : super(key: key);

  final int quantity;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final QuantityUpdateCallback onQuantityUpdated;

  @override
  Widget build(BuildContext context) {
    final color = isFavorite ? Colors.orange : Colors.grey.shade800;

    return Row(
      children: [
        IconButton.outlined(
          onPressed: () => onFavoritePressed(),
          color: color,
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: color),
              borderRadius: BorderRadius.circular(AppSpacing.sm), // <-- Radius
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 20,
          ),
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
