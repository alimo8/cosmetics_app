import 'dart:math';

import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key, this.paddingStart});
  final double? paddingStart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingStart ?? 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Transform.rotate(
            angle: pi,
            child: CircleAvatar(
              backgroundColor: Color(0xff101010).withValues(alpha: .05),
              radius: 18.r,
              child: AppImage(
                imageUrl: 'click.svg',
                width: 21.h,
                height: 21.h,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
