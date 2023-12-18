import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

/// {@template product_description_layout}
/// A reusable post medium news block widget showing post description.
/// {@endtemplate}
class ProductDescriptionLayout extends StatelessWidget {
  /// {@macro product_description_layout}
  const ProductDescriptionLayout({
    required this.title,
    required this.imageUrl,
    required this.publishedAt,
    this.description,
    this.author,
    this.onShare,
    super.key,
  });

  /// Title of post.
  final String title;

  /// Description of post.
  final String? description;

  /// The date when this post was published.
  final DateTime publishedAt;

  /// The author of this post.
  final String? author;

  /// Called when the share button is tapped.
  final VoidCallback? onShare;

  /// The url of this post image.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductImage(imageUrl: imageUrl),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Erkekler üçin şorty', style: textTheme.titleSmall),
              const SizedBox(height: 8.0),
              Expanded(child: Text('Gapdal we yz tarapyndan jübüli ýumşak şorty', style: textTheme.bodySmall)),
              const SizedBox(height: 8.0),
              Text('360,00 m.', style: textTheme.titleMedium),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),
          ProductFooter(
            onLike: onShare,
            onCart: onShare,
          ),
        ],
      ),
    );
  }
}
