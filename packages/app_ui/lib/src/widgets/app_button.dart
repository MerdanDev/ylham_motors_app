// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Button size
enum AppButtonSize {
  /// small
  small,

  /// medium
  medium,

  /// large
  large,
}

/// Button type
enum AppButtonType {
  /// primary
  primary,

  /// secondary
  secondary,

  /// tertiary
  tertiary,

  /// danger
  danger,

  /// tertiary danger
  tertiaryDanger,
}

/// {@template asman_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro asman_button}
  const AppButton._({
    this.onPressed,
    String? label,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Widget? leading,
    Widget? trailing,
    AppButtonSize? buttonSize,
    AppButtonType? buttonType,
    bool? iconOnly,
    BorderRadius? borderRadius,
    super.key,
  })  : _buttonColor = buttonColor,
        _disabledButtonColor = disabledButtonColor,
        _foregroundColor = foregroundColor,
        _disabledForegroundColor = disabledForegroundColor,
        _elevation = elevation ?? 0,
        _textStyle = textStyle,
        _padding = padding,
        _iconOnly = iconOnly ?? false,
        _leading = leading,
        _trailing = trailing,
        _buttonSize = buttonSize ?? AppButtonSize.large,
        _buttonType = buttonType ?? AppButtonType.primary,
        _label = label,
        _borderRadius = borderRadius;

  /// Labeled button contructor
  const AppButton.label({
    required String label,
    VoidCallback? onPressed,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsets? padding,
    Widget? leading,
    Widget? trailing,
    AppButtonSize? buttonSize,
    AppButtonType? buttonType,
    Key? key,
  }) : this._(
          label: label,
          onPressed: onPressed,
          buttonColor: buttonColor,
          disabledButtonColor: disabledButtonColor,
          foregroundColor: foregroundColor,
          disabledForegroundColor: disabledForegroundColor,
          elevation: elevation,
          textStyle: textStyle,
          padding: padding,
          leading: leading,
          trailing: trailing,
          iconOnly: false,
          buttonSize: buttonSize,
          buttonType: buttonType,
          key: key,
        );

  /// Icon button contructor
  const AppButton.icon({
    required Widget icon,
    VoidCallback? onPressed,
    Color? buttonColor,
    Color? disabledButtonColor,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    double? elevation,
    EdgeInsets? padding,
    AppButtonSize? buttonSize,
    AppButtonType? buttonType,
    Key? key,
  }) : this._(
          label: '',
          onPressed: onPressed,
          buttonColor: buttonColor,
          disabledButtonColor: disabledButtonColor,
          foregroundColor: foregroundColor,
          disabledForegroundColor: disabledForegroundColor,
          elevation: elevation,
          padding: padding,
          iconOnly: true,
          leading: icon,
          buttonSize: buttonSize ?? AppButtonSize.medium,
          buttonType: buttonType ?? AppButtonType.primary,
          key: key,
        );

  /// [VoidCallback] called when button is pressed.
  /// Button is disabled when null.
  final VoidCallback? onPressed;

  /// A background color of the button.
  ///
  /// Defaults to [Colors.white].
  final Color? _buttonColor;

  /// A disabled background color of the button.
  ///
  /// Defaults to [AppColors.disabledButton].
  final Color? _disabledButtonColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [AppColors.black].
  final Color? _foregroundColor;

  /// Color of the disabled text, icons etc.
  ///
  /// Defaults to [AppColors.disabledForeground].
  final Color? _disabledForegroundColor;

  /// Elevation of the button.
  final double _elevation;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? _textStyle;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets? _padding;

  /// The size of the button
  ///
  /// Default to [AppButtonSize.large].
  final AppButtonSize _buttonSize;

  /// The type of the button
  ///
  /// Default to [AppButtonType.primary].
  final AppButtonType _buttonType;

  /// The indicator of icon instead of text in the button
  final bool _iconOnly;

  /// The right side icon of the button if exists
  final Widget? _trailing;

  /// The left side icon of the button if exists
  final Widget? _leading;

  /// [String] label displayed on the button.
  final String? _label;

  /// Border radius of the button
  final BorderRadius? _borderRadius;

  static final _defaultBorderRadius = BorderRadius.circular(8);

  /// Get normal button padding
  EdgeInsets get padding => switch (_buttonSize) {
        AppButtonSize.small => const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        AppButtonSize.medium => const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        AppButtonSize.large => const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      };

  /// Get icon button padding
  EdgeInsets get iconButtonPadding => switch (_buttonSize) {
        AppButtonSize.small => const EdgeInsets.all(4),
        AppButtonSize.medium => const EdgeInsets.all(8),
        AppButtonSize.large => const EdgeInsets.all(16),
      };

  /// Get button color according to the button type
  Color get buttonColor => switch (_buttonType) {
        AppButtonType.primary => AppColors.primary,
        AppButtonType.secondary => AppColors.secondary,
        AppButtonType.tertiary => AppColors.tertiary,
        AppButtonType.danger => AppColors.danger,
        AppButtonType.tertiaryDanger => AppColors.gray[100]!,
      };

  /// Get disabled button color according to the button type
  Color get disabledButtonColor => switch (_buttonType) {
        AppButtonType.primary => AppColors.primary.shade100,
        AppButtonType.secondary => AppColors.secondary.shade100,
        AppButtonType.tertiary => AppColors.tertiary.shade100,
        AppButtonType.danger => AppColors.gray[500]!,
        AppButtonType.tertiaryDanger => AppColors.gray[25]!,
      };

  /// Get button foreground color according to the button type
  Color get foregroundColor => switch (_buttonType) {
        AppButtonType.primary => AppColors.white,
        AppButtonType.secondary => AppColors.white,
        AppButtonType.tertiary => AppColors.gray[700]!,
        AppButtonType.danger => AppColors.white,
        AppButtonType.tertiaryDanger => AppColors.danger,
      };

  /// Get disabled button foreground color according to the button type
  Color get disabledForegroundColor => switch (_buttonType) {
        _ => AppColors.white,
      };

  /// Get active button color according to the button type
  Color get activeButtonColor => switch (_buttonType) {
        AppButtonType.primary => AppColors.primary[800]!,
        AppButtonType.secondary => AppColors.primary[50]!,
        AppButtonType.tertiary => AppColors.gray[200]!,
        AppButtonType.danger => AppColors.danger.withAlpha(125),
        AppButtonType.tertiaryDanger => AppColors.gray[200]!,
      };

  /// Get label text style of button according to the button size
  AppTextStyle get textStyle => switch (_buttonSize) {
        AppButtonSize.small => const AppTextStyle.text().sm().semiBold(),
        _ => const AppTextStyle.text().md().semiBold(),
      };

  @override
  Widget build(BuildContext context) {
    final textStyle = _textStyle ?? this.textStyle;

    final padding = _padding ?? (_iconOnly ? iconButtonPadding : this.padding);
    final borderRadius = _borderRadius ?? _defaultBorderRadius;

    final buttonColor = _buttonColor ?? this.buttonColor;
    final disabledButtonColor = _disabledButtonColor ?? this.disabledButtonColor;
    final foregroundColor = _foregroundColor ?? this.foregroundColor;
    final disabledForegroundColor = _disabledForegroundColor ?? this.disabledForegroundColor;

    late Widget child;

    /// Is button icon only
    if (_iconOnly) {
      child = _leading!;
    } else {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// If the leading widget exist
          if (_leading != null) ...[
            _leading!,
            const SizedBox(width: AppSpacing.sm),
          ],

          /// Label widget
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              _label ?? '',
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),

          /// If the leading widget exist
          if (_trailing != null) ...[
            const SizedBox(width: AppSpacing.sm),
            _trailing!,
          ],
        ],
      );
    }

    final style = ButtonStyle(
      padding: MaterialStateProperty.all(padding),
      textStyle: MaterialStateProperty.all(textStyle),
      backgroundColor:
          onPressed == null ? MaterialStateProperty.all(disabledButtonColor) : MaterialStateProperty.all(buttonColor),
      elevation: MaterialStateProperty.all(_elevation),
      foregroundColor: onPressed == null
          ? MaterialStateProperty.all(disabledForegroundColor)
          : MaterialStateProperty.all(foregroundColor),
      shape: MaterialStateProperty.all(
        _iconOnly
            ? RoundedRectangleBorder(
                borderRadius: borderRadius,
              )
            : RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
      ),
      minimumSize: !_iconOnly ? null : MaterialStateProperty.all(Size.zero),
      tapTargetSize: !_iconOnly ? null : MaterialTapTargetSize.shrinkWrap,
    );

    if (_iconOnly) {
      return IconButton(
        onPressed: onPressed,
        style: style,
        icon: child,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
