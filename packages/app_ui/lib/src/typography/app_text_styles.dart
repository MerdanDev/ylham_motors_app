import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The app consists of two main text style definitions: Display and Text.
enum AppTextType {
  /// All big sized text types or headline etc.
  display,

  /// Normal sized text defination or default text
  text,
}

/// The app consists of two main text style definitions: Display and Text.
///
/// Content text style is primarily used for all content-based components,
/// e.g. news feed including articles and sections, while the UI text style
/// is used for the rest of UI components.
///
/// The default app's [TextTheme] is [AppTheme.uiTextTheme].

/// UI Display Text Style Definitions
///
/// ```dart
/// AppTextStyle.display().xxl().semibold();
/// AppTextStyle.display().xl().regular();
/// AppTextStyle.text().lg().bold();
/// AppTextStyle.text().md().medium();
/// ```
class AppTextStyle extends TextStyle {
  /// Constructor
  const AppTextStyle({
    required AppTextType textType,
    super.fontSize,
    super.fontWeight,
  })  : _textType = textType,
        super(
          package: 'app_ui',
          fontFamily: 'Inter',
          decoration: TextDecoration.none,
          textBaseline: TextBaseline.alphabetic,
        );

  /// Typography default text style
  const AppTextStyle.text() : this(textType: AppTextType.text);

  /// Typography display text style
  const AppTextStyle.display() : this(textType: AppTextType.display);

  /// Is text display styled from typography
  final AppTextType _textType;

  /// Custom copyWith
  AppTextStyle _copyWith({
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return AppTextStyle(
      textType: _textType,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }
}

/// App text style sizes like: extra large, large, medium, small, extra small
///
/// Size variants extension
extension AppTextStyleSizeExtension on AppTextStyle {
  /// `Size` - xxl (double extra large)
  ///
  ///  * display - `fontSize`: 72, `lineHeight`: 90
  ///  * text - default
  AppTextStyle xxl() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 72.sp),
        AppTextType.text => this,
      };

  /// `Size` - xl (extra large)
  ///
  ///  * display - `fontSize`: 60, `lineHeight`: 72
  ///  * text - `fontSize`: 20, `lineHeight`: 30
  AppTextStyle xl() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 60.sp),
        AppTextType.text => _copyWith(fontSize: 20.sp),
      };

  /// `Size` - lg (large)
  ///
  ///  * display - `fontSize`: 48, `lineHeight`: 60
  ///  * text - `fontSize`: 18, `lineHeight`: 28
  AppTextStyle lg() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 48.sp),
        AppTextType.text => _copyWith(fontSize: 18.sp),
      };

  /// `Size` - md (middle)
  ///
  ///  * display - `fontSize`: 36, `lineHeight`: 44
  ///  * text - `fontSize`: 16, `lineHeight`: 24
  AppTextStyle md() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 36.sp),
        AppTextType.text => _copyWith(fontSize: 16.sp),
      };

  /// `Size` - sm (small)
  ///
  ///  * display - `fontSize`: 30, `lineHeight`: 38
  ///  * text - `fontSize`: 14, `lineHeight`: 20
  AppTextStyle sm() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 30.sp),
        AppTextType.text => _copyWith(fontSize: 14.sp),
      };

  /// `Size` - xs (extra small)
  ///
  ///  * display - `fontSize`: 24, `lineHeight`: 32
  ///  * text - `fontSize`: 12, `lineHeight`: 18
  AppTextStyle xs() => switch (_textType) {
        AppTextType.display => _copyWith(fontSize: 24.sp),
        AppTextType.text => _copyWith(fontSize: 12.sp),
      };
}

/// App text style font weight variants extension
extension AppTextStyleFontWeightExtension on AppTextStyle {
  /// Font weight to regular - FontWeight.w400
  AppTextStyle regular() => _copyWith(fontWeight: AppFontWeight.regular);

  /// Font weight to medium - FontWeight.w500
  AppTextStyle medium() => _copyWith(fontWeight: AppFontWeight.medium);

  /// Font weight to semiBold - FontWeight.w600
  AppTextStyle semiBold() => _copyWith(fontWeight: AppFontWeight.semiBold);

  /// Font weight to bold - FontWeight.w700
  AppTextStyle bold() => _copyWith(fontWeight: AppFontWeight.bold);
}
