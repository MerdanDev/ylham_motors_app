// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class CartClient {
  const CartClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<CartResponse> getCart() async {
    final response = await _http.get<Map<String, dynamic>>('/carts');
    return CartResponse.fromJson(response.data!);
  }

  Future<CartResponse> updateCart(CartUpdateRequestBody body) async {
    final response = await _http.post<Map<String, dynamic>>(
      '/carts',
      data: body.toJson(),
    );

    return CartResponse.fromJson(response.data!);
  }

  Future<CartSummaryResponse> getCartSummary() async {
    final response = await _http.get<Map<String, dynamic>>('/cart/summery');
    return CartSummaryResponse.fromJson(response.data!);
  }
}
