import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template product_footer}
/// A reusable footer of a product block widget.
/// {@endtemplate}
class ProductFooter extends StatelessWidget {
  /// {@macro product_footer}
  const ProductFooter({
    super.key,
    this.onLike,
    this.onCart,
  });

  /// Called when the cart button is tapped.
  final VoidCallback? onCart;

  /// Called when the like button is tapped.
  final VoidCallback? onLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.outlined(
          onPressed: () => onLike?.call(),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.sm), // <-- Radius
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: const Icon(Icons.favorite_border_rounded),
        ),

        const SizedBox(width: AppSpacing.md),

        // // Favorite icon button
        // IconButton.filledTonal(
        //   onPressed: () => onLike?.call(),
        //   icon: const Icon(Icons.favorite_border_rounded),
        // ),

        // Add to cart icon button
        Expanded(
          child: IconButton.filled(
            onPressed: () => onCart?.call(),
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.sm), // <-- Radius
              ),
            ),
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ),
      ],
    );
  }
}
