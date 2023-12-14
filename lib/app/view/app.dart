import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/language/language.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({
    required StreamController<Exception> exceptionStream,
    super.key,
  }) : _exceptionStream = exceptionStream;

  final StreamController<Exception> _exceptionStream;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: Size(constraints.maxWidth, constraints.maxHeight),
          builder: (context, constraints) {
            return const AppView();
          },
        );
      },
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        TkMaterialLocalizations.delegate,
        TkCupertinoLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
