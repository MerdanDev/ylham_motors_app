import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

/// {@template product_image}
/// A reusable image widget displayed on the product.
/// {@endtemplate}
class ProductImage extends StatelessWidget {
  /// {@macro product_image}
  const ProductImage({
    required this.imageUrl,
    this.progressIndicatorBuilder,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  /// The aspect ratio of this image.
  static const _aspectRatio = 1.0;

  /// The url of this image.
  final String imageUrl;

  /// Border radius
  ///
  /// Default value is [BorderRadius.zero]
  final BorderRadius borderRadius;

  /// Widget displayed while the target [imageUrl] is loading.
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: progressIndicatorBuilder,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
