import 'dart:developer';

import 'package:cosmetics/core/networking/api_endpoints.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/views/home/model/most_ordered_model.dart';

class MostOrderedRepo {
  Future<List<MostOrderedModel>> getMost() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.mostOrdered,
      );

      final data = response.data;
      log('📦 MostOrderedRepo Response: $data');

      if (data is List) {
        return data.map((e) => MostOrderedModel.fromJson(e)).toList();
      } else if (data is Map && data.containsKey('data')) {
        return (data['data'] as List)
            .map((e) => MostOrderedModel.fromJson(e))
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
