import 'package:cosmetics/core/ui/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    return AppInput(hintText: widget.hintText, radius: 25.r);
  }
}
