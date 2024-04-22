// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class CategoryClient {
  const CategoryClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<CategoryListResponse> getCategories() async {
    final response = await _http.get<Map<String, dynamic>>('/categories');
    return CategoryListResponse.fromJson(response.data!);
  }
}
