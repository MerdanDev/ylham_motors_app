import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/src/overlaid_image.dart';

/// {@template product_overlaid_layout}
/// A reusable product widget that overlays the post content on the image.
/// {@endtemplate}
class ProductOverlaidLayout extends StatelessWidget {
  /// {@macro product_overlaid_layout}
  const ProductOverlaidLayout({
    required this.title,
    required this.imageUrl,
    super.key,
  });

  /// Title of roduct.
  final String title;

  /// The url of this post image displayed in overlay.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        OverlaidImage(
          imageUrl: imageUrl,
          gradientColor: AppColors.black.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Text(
            title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleSmall?.copyWith(color: AppColors.grey[700]),
          ),
        ),
      ],
    );
  }
}
