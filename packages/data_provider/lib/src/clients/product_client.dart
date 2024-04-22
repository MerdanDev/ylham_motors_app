// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class ProductClient {
  const ProductClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<ProductListResponse> getProducts([
    GetProductListQueryParameters? queryParameters,
  ]) async {
    final response = await _http.get<Map<String, dynamic>>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );

    return ProductListResponse.fromJson(response.data!);
  }
}
