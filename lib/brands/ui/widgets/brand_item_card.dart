import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class BrandItemCard extends StatelessWidget {
  const BrandItemCard({
    required this.brand,
    this.onPressed,
    super.key,
  });

  final BrandItem brand;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(2),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          /// IMAGE
          Positioned.fill(
            child: _Clipper(
              child: CachedNetworkImage(
                imageUrl: brand.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// NAME
          if (brand.name != null)
            Positioned(
              left: 0,
              right: 0,
              child: _Clipper(
                onlyBottom: true,
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.xs),
                    child: Text(
                      brand.name ?? '',
                      textAlign: TextAlign.center,
                      style: const AppTextStyle.text().sm().medium().withColor(Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Clipper extends StatelessWidget {
  const _Clipper({
    required this.child,
    this.onlyBottom = false,
  });

  final Widget child;
  final bool onlyBottom;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(AppSpacing.sm);

    final borderRadius = BorderRadius.only(
      bottomLeft: radius,
      bottomRight: radius,
      topLeft: !onlyBottom ? radius : Radius.zero,
      topRight: !onlyBottom ? radius : Radius.zero,
    );
    return ClipRRect(
      borderRadius: borderRadius,
      child: child,
    );
  }
}
