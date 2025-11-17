import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: AppImage(
          imageUrl: 'search.svg',
          fit: BoxFit.scaleDown,
          width: 18.w,
          height: 18.h,
        ),
      ),
    );
  }
}
