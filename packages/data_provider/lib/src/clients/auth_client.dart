// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:data_provider/data_provider.dart';

class AuthClient {
  const AuthClient({
    required Http httpClient,
    required TokenStorage tokenStorage,
  })  : _http = httpClient,
        _tokenStorage = tokenStorage;

  final Http _http;
  final TokenStorage _tokenStorage;

  Future<dynamic> register(RegisterRequestBody body) async {
    final requestData = jsonEncode(body.toJson());
    final response = await _http.post<Map<String, dynamic>>(
      '/register',
      data: requestData,
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

  Future<UserResponse> verify(AuthVerifyRequestBody body) async {
    final response = await _http.post<Map<String, dynamic>>(
      '/login/verify',
      data: body.toJson(),
    );

    final responseData = UserResponse.fromJson(response.data!);

    await _tokenStorage.saveToken(responseData.data!.apiToken!);

    return responseData;
  }

  Future<User> getMe() async {
    final response = await _http.get<Map<String, dynamic>>('/user');
    return User.fromJson(response.data!);
  }
}
