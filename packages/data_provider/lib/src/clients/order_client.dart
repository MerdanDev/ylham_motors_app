// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';

class OrderClient {
  const OrderClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<dynamic> createOrder(OrderCreateRequestBody body) async {
    final json = {
      'full_name': body.fullName,
      'phone': body.phone,
      'address': body.address,
      'note': body.note,
      'payment_method': '1',
      'delivery_type': 'standard',
    };
    final other = body.toJson();
    final response = await _http.post<Map<String, dynamic>>(
      '/orders',
      data: FormData.fromMap(other),
    );
    return response.data;
  }
}
