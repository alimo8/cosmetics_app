import 'dart:developer';

import 'package:cosmetics/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static Future<Response> getRequest({required String endPoint}) async {
    try {
      final response = await dio!.get(endPoint);
      return response;
    } catch (e) {
      log('Dio error: $e');
      throw Exception('Failed to fetch data from $endPoint');
    }
  }
}
