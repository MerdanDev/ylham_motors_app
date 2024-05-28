import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

/// Carousel Slider for banner ads
class BannerAdsSlider extends StatelessWidget {
  /// Constructor
  const BannerAdsSlider({
    required this.imageUrls,
    super.key,
  });

  final Iterable<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          // enlargeCenterPage: true,
          // enlargeFactor: 0.3,
        ),
        items: imageUrls.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return BannerAd(
                imageUrl: imageUrl,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

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
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
