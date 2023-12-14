// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';

/// Token adder for the request header
/// `Authorization`: `Bearer <token>`
///
class AlwaysAcceptApplicationJsonInterceptor extends Interceptor {
  /// Constructor
  const AlwaysAcceptApplicationJsonInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['alwaysAcceptApplicationJson'] == 'false') {
      // if the request doesn't need header, then just continue to the next
      // interceptor
      options.headers.remove('alwaysAcceptApplicationJson'); //remove the auxiliary header
      return handler.next(options);
    }

    // Add authorization token to request
    options.headers.addAll({'Accept': 'application/json'});

    // request
    return handler.next(options);
  }
}
