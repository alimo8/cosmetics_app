import 'dart:async';

import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            SvgPicture.asset(
              'assets/images/splash_image.svg',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 18),
            SvgPicture.asset(
              'assets/images/text_spalsh.svg',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
