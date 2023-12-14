import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// API response type [Future<Response<dynamic>>] for all responses
typedef ApiResponse = Future<Response<dynamic>>;

/// Dio extended custom Http Client
class Http extends DioForNative {
  /// Construct a new Http
  /// Add all interceptors
  Http({
    String defaultBaseUrl = '',
    TokenProvider? tokenProvider,
    LanguageProvider? languageProvider,
    bool enableLogger = false,
  })  : _defaultBaseUrl = defaultBaseUrl,
        super(
          BaseOptions(
            baseUrl: defaultBaseUrl,
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 10000),
          ),
        ) {
    interceptors.addAll(
      [
        /// Token Interceptor
        if (tokenProvider != null)
          TokenHandleInterceptor(
            tokenProvider: tokenProvider,
          ),

        /// Language interceptor
        if (languageProvider != null)
          LanguageInterceptor(
            languageProvider: languageProvider,
          ),

        /// Additional interceptor
        const AlwaysAcceptApplicationJsonInterceptor(),

        /// Pretty logger interceptor
        if (enableLogger)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            compact: false,
          ),
      ],
    );
  }

  /// Default base url
  final String _defaultBaseUrl;

  /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}
