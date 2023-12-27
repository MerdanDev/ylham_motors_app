import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/spacing/app_spacing.dart';
import 'package:flutter/material.dart';

/// App icon button
class AppIconButton extends StatelessWidget {
  /// Constructor
  const AppIconButton({
    required this.icon,
    this.onPressed,
    super.key,
  });

  /// Action on pressed
  final VoidCallback? onPressed;

  /// Icon widget
  final Widget icon;

  /// Defautl border radius
  static final _defaultBorderRadius = BorderRadius.circular(AppSpacing.md);

  @override
  Widget build(BuildContext context) {
    final borderRadius = _defaultBorderRadius;

    return InkWell(
      borderRadius: borderRadius,
      onTap: onPressed,
      splashColor: AppColors.primary.withOpacity(0.3),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: icon,
        ),
      ),
    );
  }
}
