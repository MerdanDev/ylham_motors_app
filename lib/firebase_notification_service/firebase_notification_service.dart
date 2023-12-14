// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// handle background notification messages
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint(message.notification?.title);
  debugPrint(message.notification?.body);
  debugPrint(message.data.toString());
}

const notificationIcon = 'launch_background';

class FirebaseNotificationService {
  /// FirebaseNotificationService contructor
  ///
  /// Example code:
  /// ```dart
  /// final firebaseMessaging = FirebaseMessaging.instance;
  ///
  /// final androidNotificationChannel = const AndroidNotificationChannel(
  ///  'high_importance_channel', // id
  ///  'High Importance Notifications', // title
  ///  description: 'This channel is used for important notifications.', // description
  ///  importance: Importance.high,
  ///);
  ///
  ///final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  /// ```
  const FirebaseNotificationService({
    required FirebaseMessaging firebaseMessaging,
    required AndroidNotificationChannel androidNotificationChannel,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  })  : _firebaseMessaging = firebaseMessaging,
        _androidNotificationChannel = androidNotificationChannel,
        _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  final FirebaseMessaging _firebaseMessaging; //  = FirebaseMessaging.instance;

  final AndroidNotificationChannel
      _androidNotificationChannel; /* = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
  ); */

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin; // = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    debugPrint(message.notification?.title);
  }

  Future<void> initLocalNotifications() async {
    // const iOS = IOSInitializationSettings();
    const android = AndroidInitializationSettings(notificationIcon);
    const settings = InitializationSettings(
      android: android,
      // iOS: iOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload == null) return;

        final message = RemoteMessage.fromMap(jsonDecode(response.payload!) as Map<String, dynamic>);
        handleMessage(message);
      },
    );

    final platform = _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidNotificationChannel);
  }

  Future<void> initPushNotifications() async {
    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    unawaited(FirebaseMessaging.instance.getInitialMessage().then(handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) {
        final notification = message.notification;
        final android = message.notification?.android;
        if (notification == null || android == null) return;

        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidNotificationChannel.id,
              _androidNotificationChannel.name,
              channelDescription: _androidNotificationChannel.description,
              icon: notificationIcon,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );

        // when the notification is received refresh something or else here.
      },
    );
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    unawaited(initPushNotifications());
    unawaited(initLocalNotifications());
  }
}
