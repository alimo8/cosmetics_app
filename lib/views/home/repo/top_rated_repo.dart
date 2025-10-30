import 'dart:developer';

import 'package:cosmetics/core/networking/api_endpoints.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/views/home/model/product_model.dart';

class TopRatedRepo {
  Future<List<ProductModel>> getTop() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topRated,
      );

      final data = response.data;
      log('📦 MostOrderedRepo Response: $data');

      if (data is List) {
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      log('❌ Error in MostOrderRepo: $e');
      throw Exception('Failed to load most ordered products');
    }
  }
}
