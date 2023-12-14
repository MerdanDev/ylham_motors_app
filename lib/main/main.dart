import 'dart:io';

import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/main/bootstrap/bootstrap.dart';
import 'package:data_provider/data_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  bootstrap(({
    // firebaseMessaging,
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    // const defaultLanguage = 'en';
    const defaultBaseUrl = ''; // Env.serverUrl;

    /// Storages
    final tokenStorage = InMemoryTokenStorage();
    // const secureStorage = SecureStorage();

    /// intialization of package_info
    final packageInfo = await PackageInfo.fromPlatform();

    /// HTTP Client
    final httpClient = Http(
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      // languageProvider: settingsStorage.fetchAppLanguage,
    );

    /// Only for development
    HttpOverrides.global = MyHttpOverrides();

    return App(
      exceptionStream: exceptionStream,
    );
  });
}
