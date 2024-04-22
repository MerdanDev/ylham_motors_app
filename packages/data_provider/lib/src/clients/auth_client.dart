// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class AuthClient {
  const AuthClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<dynamic> register(RegisterRequestBody body) async {
    final response = await _http.post<Map<String, dynamic>>(
      '/register',
      data: body.toJson(),
    );

    return response;
  }

  Future<dynamic> login(LoginRequestBody body) async {
    final response = await _http.post<Map<String, dynamic>>(
      '/login',
      data: body.toJson(),
    );

    return response;
  }

  Future<bool> verify(AuthVerifyRequestBody body) async {
    final response = await _http.post<Map<String, dynamic>>(
      '/login/verify',
      data: body.toJson(),
    );

    return response.statusCode == 200;
  }
}
