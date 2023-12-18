import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:ylham_motors_ui/ylham_motors_ui.dart';

/// {@template banner_ad}
/// A reusable banner ad block widget.
/// {@endtemplate}
class BannerAd extends StatelessWidget {
  /// {@macro banner_ad}
  const BannerAd({
    required this.imageUrl,
    this.borderRadius,
    super.key,
  });

  /// The associated banner image url.
  final String imageUrl;

  /// Border radius
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const ProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
