import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// App card
class AppCard extends StatelessWidget {
  /// Constructor
  const AppCard({
    required this.child,
    this.onPressed,
    this.borderRadius,
    this.color,
    this.padding,
    super.key,
  });

  /// On card pressed
  final VoidCallback? onPressed;

  /// Card child
  final Widget child;

  /// Card border radius
  final BorderRadius? borderRadius;

  /// Card color
  final Color? color;

  /// Card padding
  final EdgeInsets? padding;

  static final _defaultBorderRadius = BorderRadius.circular(AppSpacing.sm);
  // static final _defaultColor = Colors.blueGrey[50];
  static final _defaultColor = AppColors.primary.withOpacity(0.1);
  static const _defaultPadding = EdgeInsets.all(AppSpacing.md);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? _defaultBorderRadius;
    final color = this.color ?? _defaultColor;
    final padding = this.padding ?? _defaultPadding;

    return Material(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: Clip.hardEdge,
      color: color,
      child: InkWell(
        splashColor: AppColors.primary.shade100,
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
