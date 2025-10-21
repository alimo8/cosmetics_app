import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppAssets(
              imageUrl: _list[currentIndex].imageUrl,
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 28.h),
            Text(
              _list[currentIndex].title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            Text(
              _list[currentIndex].descreption,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h),
            currentIndex != 2
                ? Center(
                    child: FloatingActionButton(
                      backgroundColor: Color(0xff434C6D),
                      onPressed: () {
                        currentIndex++;
                        setState(() {});
                      },
                      child: AppAssets(imageUrl: 'click.svg'),
                    ),
                  )
                : CustomFilledButton(
                    onPressed: () {
                      goTo(LoginView(), canPop: false);
                    },
                    text: 'let’s start!',
                    color: Color(0xff434C6D),
                  ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String imageUrl;
  final String title;
  final String descreption;

  _Model({
    required this.imageUrl,
    required this.title,
    required this.descreption,
  });
}

final _list = [
  _Model(
    imageUrl: 'boarding_1.png',
    title: 'WELCOME!',
    descreption:
        'Makeup has the power to transform your mood and empowers you to be a more confident person.',
  ),
  _Model(
    imageUrl: 'boarding_2.png',
    title: 'SEARCH & PICK',
    descreption:
        'We have dedicated set of products and routines hand picked for every skin type.',
  ),
  _Model(
    imageUrl: 'boarding_3.png',
    title: 'PUCH NOTIFICATIONS ',
    descreption: 'Allow notifications for new makeup & cosmetics offers.',
  ),
];
