// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class BrandClient {
  const BrandClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<BrandListResponse> getCategories() async {
    final response = await _http.get<Map<String, dynamic>>('/brands');
    return BrandListResponse.fromJson(response.data!);
  }
}
