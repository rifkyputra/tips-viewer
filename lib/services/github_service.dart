import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GithubService {
  final Dio dioClient;

  GithubService(this.dioClient);

  Future<T> get<T>({
    required String url,
    String? token,
  }) async {
    final response = await dioClient.get(
      url,
      queryParameters: {'Authorization': 'Bearer $token'},
    );

    try {
      return response.data as T;
    } catch (e, s) {
      debugPrint('$e, $s');

      rethrow;
    }
  }
}
