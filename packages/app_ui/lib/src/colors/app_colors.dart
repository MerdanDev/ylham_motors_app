// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
class AppColors {
  /// Primary color
  static const MaterialColor primary = motoblue; // Colors.lightBlue;

  /// From icon blue color
  static const MaterialColor motoblue = MaterialColor(_motobluePrimaryValue, <int, Color>{
    50: Color(0xFFE2F2F9),
    100: Color(0xFFB8DFF0),
    200: Color(0xFF88CAE6),
    300: Color(0xFF58B4DB),
    400: Color(0xFF35A4D4),
    500: Color(_motobluePrimaryValue),
    600: Color(0xFF0F8CC7),
    700: Color(0xFF0C81C0),
    800: Color(0xFF0A77B9),
    900: Color(0xFF0565AD),
  });

  static const int _motobluePrimaryValue = 0xFF1194CC;

  /// Motoblue color accent
  static const MaterialColor motoblueAccent = MaterialColor(_motoblueAccentValue, <int, Color>{
    100: Color(0xFFD8ECFF),
    200: Color(_motoblueAccentValue),
    400: Color(0xFF72BBFF),
    700: Color(0xFF59AFFF),
  });
  static const int _motoblueAccentValue = 0xFFA5D4FF;

  /// Coral color
  static const MaterialColor coral = MaterialColor(_coralPrimaryValue, <int, Color>{
    50: Color(0xFFFFF0EA),
    100: Color(0xFFFFD9CB),
    200: Color(0xFFFFBFA8),
    300: Color(0xFFFFA585),
    400: Color(0xFFFF926A),
    500: Color(_coralPrimaryValue),
    600: Color(0xFFFF7749),
    700: Color(0xFFFF6C40),
    800: Color(0xFFFF6237),
    900: Color(0xFFFF4F27),
  });
  static const int _coralPrimaryValue = 0xFFFF7F50;

  /// Coral color accent
  static const MaterialColor coralAccent = MaterialColor(_coralAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_coralAccentValue),
    400: Color(0xFFFFDBD4),
    700: Color(0xFFFFC6BB),
  });
  static const int _coralAccentValue = 0xFFFFFFFF;

  /// Tan color
  static const MaterialColor tan = MaterialColor(_tanPrimaryValue, <int, Color>{
    50: Color(0xFFF0F8FC),
    100: Color(0xFFD8EFF7),
    200: Color(0xFFBFE4F1),
    300: Color(0xFFA5D9EB),
    400: Color(0xFF91D0E7),
    500: Color(_tanPrimaryValue),
    600: Color(0xFF76C2E0),
    700: Color(0xFF6BBBDC),
    800: Color(0xFF61B4D8),
    900: Color(0xFF4EA7D0),
  });
  static const int _tanPrimaryValue = 0xFF7EC8E3;

  /// Tan accent
  static const MaterialColor tanAccent = MaterialColor(_tanAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_tanAccentValue),
    400: Color(0xFFC7EDFF),
    700: Color(0xFFADE4FF),
  });
  static const int _tanAccentValue = 0xFFFAFDFF;

  // /// Primary active color
  // static const Color primaryActive = primary[700]!;

  // /// Primary disabled color
  // static const Color primaryDisabled = Color(0xFF98A2B3);

  /// Secondary color
  static const MaterialColor secondary = coral; // Color(0xFFFEC41F);

  // /// Secondary active color
  // static const Color secondaryActive = Color(0xFFECF5FF);

  // /// Secondary disabled color
  // static const Color secondaryDisabled = Color(0xFF98A2B3);

  /// Secondary gray color
  static const Color secondaryGray = Color(0xFF919299);

  /// Tertiary color
  static const MaterialColor tertiary = tan; // Color(0xFFE3E3E5);

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

  /// Silver color
  static const Color silver = Color(0xFFC0C0C0);

  // static const int _primarySilver = 0xFFC0C0C0;

  // /// Silver color
  // static const MaterialColor silver = MaterialColor(
  //   _primarySilver,
  //   {
  //     50: Color.fromRGBO(106, 106, 106, 1),
  //     100: Color.fromRGBO(115, 115, 115, 1),
  //     200: Color.fromRGBO(134, 134, 134, 1),
  //     300: Color.fromRGBO(154, 154, 154, 1),
  //     400: Color.fromRGBO(173, 173, 173, 1),
  //     500: Color.fromRGBO(192, 192, 192, 1),
  //     600: Color.fromRGBO(173, 173, 173, 1),
  //     700: Color.fromRGBO(154, 154, 154, 1),
  //     800: Color.fromRGBO(134, 134, 134, 1),
  //     900: Color.fromRGBO(115, 115, 115, 1),
  //   },
  // );
}
