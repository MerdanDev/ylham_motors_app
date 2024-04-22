// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class ProfileClient {
  const ProfileClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<Profile> getMe() async {
    final response = await _http.get<Map<String, dynamic>>('/user');
    return Profile.fromJson(response.data!);
  }
}
