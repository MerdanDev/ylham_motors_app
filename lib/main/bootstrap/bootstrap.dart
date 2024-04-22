import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_bloc_observer.dart';

typedef AppBuilder = Future<Widget> Function({
  // required FirebaseMessaging firebaseMessaging,
  required SharedPreferences sharedPreferences,
  required StreamController<Exception> exceptionStream,
});

Future<void> bootstrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp();

      // Initialize date formatting
      await initializeDateFormatting();

      StreamController<Exception> exceptionStream = StreamController();

      // final analyticsRepository = AnalyticsRepository(FirebaseAnalytics.instance);

      // final firebaseMessaging = FirebaseMessaging.instance;

      // const androidNotificationChannel = AndroidNotificationChannel(
      //   'high_importance_channel', // id
      //   'High Importance Notifications', // title
      //   description: 'This channel is used for important notifications.', // description
      //   importance: Importance.high,
      // );

      // final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // FirebaseNotificationService(
      //   androidNotificationChannel: androidNotificationChannel,
      //   firebaseMessaging: firebaseMessaging,
      //   flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      // ).initNotifications();

      final blocObserver = AppBlocObserver(
        // analyticsRepository: analyticsRepository,
        exceptionStream: exceptionStream,
      );
      Bloc.observer = blocObserver;
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationSupportDirectory(),
      );

      /// Hive Box
      await Hive.initFlutter();
      // final dir = await getApplicationSupportDirectory();
      // Hive. = dir.path;

      // if (kDebugMode) {
      //   await HydratedBloc.storage.clear();
      // }

      final sharedPreferences = await SharedPreferences.getInstance();

      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      // unawaited(MobileAds.instance.initialize());

      runApp(
        await builder(
          // firebaseMessaging,
          sharedPreferences: sharedPreferences,
          exceptionStream: exceptionStream,
        ),
      );
    },
    (exception, stackTrace) async {
      // await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    },
  );
}
