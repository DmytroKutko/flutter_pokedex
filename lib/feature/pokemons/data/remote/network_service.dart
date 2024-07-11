import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/utils/constants/constants.dart';

class NetworkService {
  final http.Client client;

  NetworkService({required this.client});

  Future<Map<String, dynamic>> getPokedex(int limit, int offset) async {
    const path = "/api/v2/pokemon";
    final queryParameters = {
      'offset': offset.toString(),
      'limit': limit.toString(),
    };
    final uri = Uri.https(baseUrl, path, queryParameters);
    final response = await client.get(uri);
    if (response.statusCode >= 200 && response.statusCode > 300) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
