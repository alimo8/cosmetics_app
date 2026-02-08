import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'components/item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoriesModel>? list;

  Future<void> getCategoryData() async {
    final response = await DioHelper.getRequest(endPoint: '/api/Categories');
    list = CategoriesData.fromJson({'list': response.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text('Categories'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSearch(hintText: 'Search'),
            SizedBox(height: 30.h),
            list == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list!.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      thickness: 0.8,
                      height: 40.h,
                    ),
                    itemBuilder: (context, index) {
                      return _Item(list![index]);
                    },
                  ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

class CategoriesData {
  late final List<CategoriesModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'],
    ).map((e) => CategoriesModel.fromJson(e)).toList();
  }
}

class CategoriesModel {
  late final int id;
  late final String title;
  late final String imageUrl;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
  }
}
