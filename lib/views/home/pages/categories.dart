import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_search.dart';
import 'package:cosmetics/views/home/cubit/category_cubit.dart';
import 'package:cosmetics/views/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    context.read<CategoryCubit>().getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text('Categories'),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is CategoryErorr) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is CategorySuccess) {
            final categories = state.categories;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSearch(hintText: 'Search'),
                  SizedBox(height: 30.h),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      thickness: 0.8,
                      height: 40.h,
                    ),
                    itemBuilder: (context, index) {
                      return _Item(categories[index]);
                    },
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.categoryModel);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: AppImage(
            imageUrl: categoryModel.image,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            categoryModel.name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff434C6D),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: AppImage(
            imageUrl: 'arrow_right.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
