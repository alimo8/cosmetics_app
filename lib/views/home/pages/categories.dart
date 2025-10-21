import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInput(hintText: 'Search'),
            SizedBox(height: 30.h),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey, thickness: 0.8, height: 40),
              itemBuilder: (context, index) {
                return _Item();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: AppAssets(
            imageUrl:
                'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
            width: 80.w,
            height: 80.h,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            'Category Name',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff434C6D),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: AppAssets(
            imageUrl: 'arrow-right_icon.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
