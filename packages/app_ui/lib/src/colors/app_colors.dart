import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
class AppColors {
  /// Primary color
  static const Color primary = Color(0xFF3E52BC);

  // /// Primary active color
  // static const Color primaryActive = Color(0xFF253BAE);

  // /// Primary disabled color
  // static const Color primaryDisabled = Color(0xFF98A2B3);

  /// Secondary color
  static const Color secondary = Color(0xFFDDECFF); // Color(0xFFFEC41F);

  // /// Secondary active color
  // static const Color secondaryActive = Color(0xFFECF5FF);

  // /// Secondary disabled color
  // static const Color secondaryDisabled = Color(0xFF98A2B3);

  /// Secondary gray color
  static const Color secondaryGray = Color(0xFF919299);

  /// Tertiary color
  static const Color tertiary = Color(0xFFF2F4F7); // Color(0xFFE3E3E5);

  // /// Tertiary active color
  // static const Color tertiaryActive = Color(0xFFEAECF0);

  // /// Tertiary disabled color
  // static const Color tertiaryDisabled = Color(0xFFFCFCFD);

  /// Additional color
  static const Color additional = Color(0xFFEDEEF0);

  /// Background color
  static const Color background = Color(0xFFF7F8FA);

  /// Success color
  static const Color success = Color(0xFF00B74A);

  /// Danger color
  static const Color danger = Color(0xFFF04438);

  // /// Danger active color
  // static const Color dangerActive = Color(0xFFF04438);

  // /// Danger disabled color
  // static const Color dangerDisabled = Color(0xFF98A2B3);

  /// Error color
  static const Color error = Color(0xFFF04438);

  /// Warning color
  static const Color warning = Color(0xFFF79009);

  /// The grey primary color and swatch.
  static const MaterialColor grey = Colors.grey;

  /// Cerulean blue color & swatch
  static const MaterialColor ceruleanBlue = MaterialColor(
    _primaryCerBlue,
    <int, Color>{
      50: Color(0xFFF2F5FC),
      100: Color(0xFFe2e8f7),
      150: Color(0xFFcbd7f2),
      200: Color(0xFFa7bee9),
      300: Color(0xFF7d9cdd),
      400: Color(0xFF5f7cd2),
      500: Color(_primaryCerBlue),
      600: Color(0xFF3E52BC),
      700: Color(0xFF4252b8),
      800: Color(0xFF3a4493),
      900: Color(0xFF333c75),
      950: Color(0xFF232648),
    },
  );

  static const int _primaryCerBlue = 0xFF4b62c5;

  /// The gray neutral color and swatch.
  static const MaterialColor gray = MaterialColor(
    _primaryGray,
    <int, Color>{
      25: Color(0xFFFCFCFD),
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF2F4F7),
      150: Color(0xFFeaecf0),
      200: Color(0xFFEAECF0),
      300: Color(0xFFD0D5DD),
      400: Color(0xFF98A2B3),
      500: Color(_primaryGray),
      600: Color(0xFF475467),
      700: Color(0xFF344054),
      800: Color(0xFF182230),
      900: Color(0xFF101828),
      950: Color(0xFF0C111D),
    },
  );

  static const int _primaryGray = 0xFF475467;

  /// White color
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// White color with 50% opacity
  static Color white05 = const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5);

  /// Black color
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  /// The default disabled foreground color.
  static const Color disabledForeground = Color(0x611B1B1B);

  /// The default disabled button color.
  static const Color disabledButton = Color(0x1F000000);

  /// The default disabled surface color.
  static const Color disabledSurface = Color(0xFFE0E0E0);

  // static const int _lightGreenPrimaryValue = 0xFF8BC34A;
}
