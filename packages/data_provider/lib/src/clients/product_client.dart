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

  Future<ProductListResponse> getFavorites({int page = 1}) async {
    final response = await _http.get<Map<String, dynamic>>(
      '/halanlarym',
      queryParameters: {
        'page': page,
      },
    );
    return ProductListResponse.fromJson(response.data!);
  }
}
