import 'dart:async';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
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
    goTo(OnBoardingView(), canPop: false, delayInSeconds: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(imageUrl: 'splash.svg', width: 150.w, height: 150.h),
            SizedBox(height: 18.h),
            AppImage(imageUrl: 'text_spalsh.svg', width: 50.w, height: 50.h),
          ],
        ),
      ),
    );
  }
}
