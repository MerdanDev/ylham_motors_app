// ignore_for_file: lines_longer_than_80_chars

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template asman_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro asman_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      // iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      // dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      // buttonTheme: _buttonTheme,
      // splashColor: AppColors.transparent,
      // snackBarTheme: _snackBarTheme,
      // elevatedButtonTheme: _elevatedButtonTheme,
      // textButtonTheme: _textButtonTheme,
      colorScheme: _colorScheme,
      // bottomSheetTheme: _bottomSheetTheme,
      // listTileTheme: _listTileTheme,
      // switchTheme: _switchTheme,
      // progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      // chipTheme: _chipTheme,
    );
  }

  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xFFFAFAFA),
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      tertiary: AppColors.tertiary,
      onTertiary: Colors.white,
      // errorContainer: Colors.red.shade100,
      // inversePrimary: Colors.white,
      // inverseSurface: Colors.black,
      // onErrorContainer: Colors.white70,
      // onInverseSurface: Colors.white,
      // onPrimaryContainer: Colors.white70,
      // onSecondaryContainer: Colors.white70,
      // onSurfaceVariant: Colors.grey.shade400,
      // onTertiaryContainer: Colors.black,
      // outline: Colors.grey.shade800,
      // outlineVariant: Colors.grey.shade500,
      // primaryContainer: AppColors.primary.shade800,
      // scrim: Colors.black54,
      // secondaryContainer: AppColors.primary.shade200,
      // shadow: Colors.grey.shade600,
      // surfaceTint: AppColors.primary,
      // surfaceVariant: Colors.grey.shade200,
      // tertiaryContainer: AppColors.tertiary.shade200,
    );
  }

  // SnackBarThemeData get _snackBarTheme {
  //   return SnackBarThemeData(
  //     contentTextStyle: UITextStyle.bodyText1.copyWith(
  //       color: AppColors.white,
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(AppSpacing.sm),
  //     ),
  //     actionTextColor: AppColors.lightBlue.shade300,
  //     backgroundColor: AppColors.black,
  //     elevation: 4,
  //     behavior: SnackBarBehavior.floating,
  //   );
  // }

  Color get _backgroundColor => AppColors.white;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme.copyWith(color: AppColors.white),
      titleTextStyle: const AppTextStyle.display().xs().semiBold().copyWith(letterSpacing: 1, fontFamily: 'Ubuntu'),
      elevation: 1,
      toolbarHeight: 64,
      backgroundColor: AppColors.primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
        // color: AppColors.onBackground,
        );
  }

  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      // backgroundColor: AppColors.primary.shade100,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryGray,
      selectedLabelStyle: const AppTextStyle.text().medium().copyWith(color: AppColors.primary, fontSize: 11),
      unselectedLabelStyle: const AppTextStyle.text().regular().copyWith(color: AppColors.secondaryGray, fontSize: 10),
    );
  }

  // DividerThemeData get _dividerTheme {
  //   return const DividerThemeData(
  //     color: AppColors.outlineLight,
  //     space: AppSpacing.lg,
  //     thickness: AppSpacing.xxxs,
  //     indent: AppSpacing.lg,
  //     endIndent: AppSpacing.lg,
  //   );
  // }

  TextTheme get _textTheme => uiTextTheme;

  // /// The Content text theme based on [ContentTextStyle].
  // static final contentTextTheme = TextTheme(
  //   displayLarge: ContentTextStyle.headline1,
  //   displayMedium: ContentTextStyle.headline2,
  //   displaySmall: ContentTextStyle.headline3,
  //   headlineMedium: ContentTextStyle.headline4,
  //   headlineSmall: ContentTextStyle.headline5,
  //   titleLarge: ContentTextStyle.headline6,
  //   titleMedium: ContentTextStyle.subtitle1,
  //   titleSmall: ContentTextStyle.subtitle2,
  //   bodyLarge: ContentTextStyle.bodyText1,
  //   bodyMedium: ContentTextStyle.bodyText2,
  //   labelLarge: ContentTextStyle.button,
  //   bodySmall: ContentTextStyle.caption,
  //   labelSmall: ContentTextStyle.overline,
  // ).apply(
  //   bodyColor: AppColors.black,
  //   displayColor: AppColors.black,
  //   decorationColor: AppColors.black,
  // );

  /// The UI text theme based on [AppTextStyle].
  static final uiTextTheme = TextTheme(
    displayLarge: const AppTextStyle.text().headline1(),
    displayMedium: const AppTextStyle.text().headline2(),
    displaySmall: const AppTextStyle.text().headline3(),
    headlineMedium: const AppTextStyle.text().headline4(),
    headlineSmall: const AppTextStyle.text().headline5(),
    titleLarge: const AppTextStyle.text().headline6(),
    titleMedium: const AppTextStyle.text().subtitle1(),
    titleSmall: const AppTextStyle.text().subtitle2(),
    bodyLarge: const AppTextStyle.text().bodyText1(),
    bodyMedium: const AppTextStyle.text().bodyText2(),
    labelLarge: const AppTextStyle.text().button(),
    bodySmall: const AppTextStyle.text().caption(),
    labelSmall: const AppTextStyle.text().overline(),
  ).apply(
      // bodyColor: AppColors.black,
      // displayColor: AppColors.black,
      // decorationColor: AppColors.black,
      );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      iconColor: AppColors.primary,
      suffixIconColor: AppColors.primary,
      prefixIconColor: AppColors.primary,
      hoverColor: AppColors.primary.shade100.withOpacity(0.5),
      focusColor: AppColors.primary.shade100.withOpacity(0.2),
      labelStyle: const AppTextStyle.text().sm().withColor(AppColors.primary.shade500),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const OutlineInputBorder(),
      outlineBorder: const BorderSide(color: AppColors.primary),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.primary, width: 2)),
      filled: true,
      isDense: true,
    );
  }

  // ButtonThemeData get _buttonTheme {
  //   return ButtonThemeData(
  //     textTheme: ButtonTextTheme.primary,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(AppSpacing.sm),
  //     ),
  //   );
  // }

  // ElevatedButtonThemeData get _elevatedButtonTheme {
  //   return ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(30)),
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
  //       textStyle: _textTheme.labelLarge,
  //       backgroundColor: AppColors.blue,
  //     ),
  //   );
  // }

  // TextButtonThemeData get _textButtonTheme {
  //   return TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       textStyle: _textTheme.labelLarge?.copyWith(
  //         fontWeight: AppFontWeight.light,
  //       ),
  //       foregroundColor: AppColors.black,
  //     ),
  //   );
  // }

  // BottomSheetThemeData get _bottomSheetTheme {
  //   return const BottomSheetThemeData(
  //     backgroundColor: AppColors.modalBackground,
  //     clipBehavior: Clip.hardEdge,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(AppSpacing.lg),
  //         topRight: Radius.circular(AppSpacing.lg),
  //       ),
  //     ),
  //   );
  // }

  // ListTileThemeData get _listTileTheme {
  //   return const ListTileThemeData(
  //     iconColor: AppColors.onBackground,
  //     contentPadding: EdgeInsets.all(AppSpacing.lg),
  //   );
  // }

  // SwitchThemeData get _switchTheme {
  //   return SwitchThemeData(
  //     thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
  //       if (states.contains(MaterialState.selected)) {
  //         return AppColors.darkAqua;
  //       }
  //       return AppColors.eerieBlack;
  //     }),
  //     trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
  //       if (states.contains(MaterialState.selected)) {
  //         return AppColors.primaryContainer;
  //       }
  //       return AppColors.paleSky;
  //     }),
  //   );
  // }

  // ProgressIndicatorThemeData get _progressIndicatorTheme {
  //   return const ProgressIndicatorThemeData(
  //     color: AppColors.darkAqua,
  //     circularTrackColor: AppColors.borderOutline,
  //   );
  // }

  TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      // labelStyle: ,
      labelColor: AppColors.white,
      indicatorColor: AppColors.white,
      // unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: Colors.white70,
      // indicator: UnderlineTabIndicator(
      //   borderSide: BorderSide(
      //     width: 3,
      //     color: AppColors.white,
      //   ),
      // ),
      // indicatorSize: TabBarIndicatorSize.label,
    );
  }
}

// InputBorder get _textFieldBorder => const UnderlineInputBorder(
//       borderSide: BorderSide(
//         width: 1.5,
//         color: AppColors.darkAqua,
//       ),
//     );

// ChipThemeData get _chipTheme {
//   return const ChipThemeData(
//     backgroundColor: AppColors.transparent,
//   );
// }

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  // @override
  // ColorScheme get _colorScheme {
  //   return const ColorScheme.dark().copyWith(
  //     primary: AppColors.white,
  //     secondary: AppColors.secondary,
  //     background: AppColors.grey.shade900,
  //   );
  // }

  // @override
  // TextTheme get _textTheme {
  //   return AppTheme.contentTextTheme.apply(
  //     bodyColor: AppColors.white,
  //     displayColor: AppColors.white,
  //     decorationColor: AppColors.white,
  //   );
  // }

  // @override
  // SnackBarThemeData get _snackBarTheme {
  //   return SnackBarThemeData(
  //     contentTextStyle: UITextStyle.bodyText1.copyWith(
  //       color: AppColors.black,
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(AppSpacing.sm),
  //     ),
  //     actionTextColor: AppColors.lightBlue.shade300,
  //     backgroundColor: AppColors.grey.shade300,
  //     elevation: 4,
  //     behavior: SnackBarBehavior.floating,
  //   );
  // }

  // @override
  // TextButtonThemeData get _textButtonTheme {
  //   return TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       textStyle: _textTheme.labelLarge?.copyWith(
  //         fontWeight: AppFontWeight.light,
  //       ),
  //       foregroundColor: AppColors.white,
  //     ),
  //   );
  // }

  @override
  Color get _backgroundColor => AppColors.grey.shade900;

  // @override
  // IconThemeData get _iconTheme {
  //   return const IconThemeData(color: AppColors.white);
  // }

  // @override
  // DividerThemeData get _dividerTheme {
  //   return const DividerThemeData(
  //     color: AppColors.onBackground,
  //     space: AppSpacing.lg,
  //     thickness: AppSpacing.xxxs,
  //     indent: AppSpacing.lg,
  //     endIndent: AppSpacing.lg,
  //   );
  // }
}
