// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';

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

  Future<dynamic> addFavorite(int productId) async {
    final data = FormData.fromMap({
      'product_id': productId,
    });

    final response = await _http.post<Map<String, dynamic>>(
      '/halanlarym',
      data: data,
    );
    return response.data;
  }

  Future<dynamic> removeFavorite(int productId) async {
    final data = FormData.fromMap({
      'product_id': productId,
    });

    final response = await _http.post<Map<String, dynamic>>(
      '/halanlarym',
      data: data,
    );
    return response.data;
  }
}
