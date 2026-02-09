import 'package:cosmetics/core/logic/cach_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cosmatics.growfet.com',
      receiveDataWhenStatusError: true,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<CustomResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.token}",
    });

    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
      print(response.data);

      if (response.statusCode == 200) {
        return CustomResponse(isSucces: true, data: response.data);
      }
      return CustomResponse(isSucces: false, data: response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        CacheHelper.logout();
        goTo(LoginView(), canPop: false);
      }
      return CustomResponse(isSucces: false, data: e.response?.data);
    }
  }

  static Future<CustomResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers.addAll({
      "Authorization": "Bearer ${CacheHelper.token}",
    });
    try {
      final response = await _dio.post(endPoint, data: data);
      print(response.data);

      if (response.statusCode == 200) {
        return CustomResponse(isSucces: true, data: response.data);
      }
      return CustomResponse(isSucces: false, data: response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        CacheHelper.logout();
        goTo(LoginView(), canPop: false);
      }
      return CustomResponse(isSucces: false, data: e.response?.data);
    }
  }
}

class CustomResponse {
  final bool isSucces;
  late final String? msg;
  final data;

  CustomResponse({required this.isSucces, this.data}) {
    msg = data is Map ? data['message'] : null;
  }
}
