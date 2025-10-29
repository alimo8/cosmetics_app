import 'dart:developer';
import 'package:cosmetics/core/networking/api_endpoints.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/views/home/model/category_model.dart';

class CategoryRepo {
  Future<List<CategoryModel>> getCategoryPage() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );

      final data = response.data;

      // يتأكد إذا كانت البيانات مباشرة أو جوه "data"
      final List list = data is List ? data : data['data'];

      return list.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      log('Error in CategoryRepo: $e');
      return []; // لو حصل خطأ، يرجع ليست فاضية
    }
  }
}

// import 'dart:developer';
// import 'package:cosmetics/core/networking/api_endpoints.dart';
// import 'package:cosmetics/core/networking/dio_helper.dart';
// import 'package:cosmetics/views/home/model/category_model.dart';

// class CategoryRepo {
//   Future<List<CategoryModel>> getCategoryPage() async {
//     try {
//       final response = await DioHelper.getRequest(
//         endPoint: ApiEndpoints.categories,
//       );

//       final data = response.data;

//       if (data is List) {
//         return data.map((e) => CategoryModel.fromJson(e)).toList();
//       } else if (data is Map && data.containsKey('data')) {
//         return (data['data'] as List)
//             .map((e) => CategoryModel.fromJson(e))
//             .toList();
//       } else {
//         throw Exception('Unexpected response format');
//       }
//     } catch (e) {
//       log('❌ Error in CategoryRepo: $e');
//       throw Exception('Failed to load categories');
//     }
//   }
// }
