import 'package:dio/dio.dart';

/// Signature for the authentication token provider.
typedef TokenProvider = Future<String?> Function();

/// Token adder for the request header
/// `Authorization`: `Bearer <token>`
///
class TokenHandleInterceptor extends Interceptor {
  /// Constructor
  const TokenHandleInterceptor({
    required TokenProvider tokenProvider,
  }) : _tokenProvider = tokenProvider;

  final TokenProvider _tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['requiresToken'] == 'false') {
      // if the request doesn't need token, then just continue to the next
      // interceptor
      options.headers.remove('requiresToken'); //remove the auxiliary header
      return handler.next(options);
    }

    // get token
    final token = await _tokenProvider();

    // Add authorization token to request
    options.headers.addAll({'Authorization': 'Bearer $token'});

    // request
    return handler.next(options);
  }
}
