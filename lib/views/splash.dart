import 'dart:async';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      goTo(OnBoardingView(), canPop: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets(
              imageUrl: 'splash_image.svg',
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 18.h),
            AppAssets(imageUrl: 'text_spalsh.svg', width: 50.w, height: 50.h),
          ],
        ),
      ),
    );
  }
}
