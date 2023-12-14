import 'package:dio/dio.dart';

/// Signature for the accept language provider.
typedef LanguageProvider = Future<String?> Function();

/// Language adder for the request header
/// `Accept-Language`: `<language>`
///
class LanguageInterceptor extends Interceptor {
  /// Constructor
  const LanguageInterceptor({
    required LanguageProvider languageProvider,
  }) : _languageProvider = languageProvider;

  final LanguageProvider _languageProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // get language
    final language = await _languageProvider();

    final modifiedLanguage = switch (language) {
      'tk' => 'tm',
      null => 'tm',
      _ => language,
    };

    // Add accept language to request
    options.headers.addAll({'Accept-Language': modifiedLanguage});

    // request
    return handler.next(options);
  }
}
