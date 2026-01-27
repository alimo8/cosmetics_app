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
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static Future<CustomResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio!.get(
        endPoint,
        queryParameters: queryParameters,
      );
      // print(response.data);
      if (response.data != null) {
        return CustomResponse(isSucces: true, data: response.data);
      }
      return CustomResponse(isSucces: false);
    } on DioException catch (e) {
      if (e.response?.data != null && e.response?.data is Map) {
        log(e.response?.data['message']);
        // print(e.response?.statusCode);
      }
      return CustomResponse(isSucces: false, data: e.response?.data);
    }
  }

  static Future<CustomResponse> postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.post(endPoint, data: data);
      // print(response.data);
      // log(response.data);

      if (response.data != null) {
        return CustomResponse(isSucces: true, data: response.data);
      }
      return CustomResponse(isSucces: false);
    } on DioException catch (e) {
      return CustomResponse(isSucces: false, msg: e.response?.data['message']);
    }
  }
}

class CustomResponse {
  final bool isSucces;
  final String? msg;
  final dynamic data;

  CustomResponse({required this.isSucces, this.msg, this.data});
}
