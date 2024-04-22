// ignore_for_file: public_member_api_docs

import 'package:data_provider/data_provider.dart';

class SliderClient {
  const SliderClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<SliderListResponse> getSliders() async {
    final response = await _http.get<Map<String, dynamic>>('/sliders');
    return SliderListResponse.fromJson(response.data!);
  }
}
