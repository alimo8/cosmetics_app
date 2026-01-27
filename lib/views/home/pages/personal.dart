import 'package:cosmetics/core/logic/cach_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            children: [
              SizedBox(height: 120.h),
              ClipOval(
                child: AppImage(
                  imageUrl:
                      'https://i.pinimg.com/736x/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg',
                  width: 100.w,
                  height: 100.h,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Ali Mohamed',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xff434C6D),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _Item(urlIcon: 'edit_info.svg', title: 'Edit Info'),
                  _Item(urlIcon: 'order_history.svg', title: 'Order History'),
                  _Item(urlIcon: 'wallet.svg', title: 'Wallet'),
                  _Item(urlIcon: 'setting.svg', title: 'Settings'),
                  _Item(urlIcon: 'order_history.svg', title: 'Voucher '),
                  _Item(urlIcon: 'order_history.svg', title: 'Voucher '),
                  _Item(urlIcon: 'logout.svg', title: 'Logout', isLogout: true),
                ],
              ),
              SizedBox(height: 160.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.urlIcon,
    required this.title,
    this.isLogout = false,
  });

  final String urlIcon;
  final String title;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: InkWell(
        onTap: () async {
          if (isLogout) {
            await CacheHelper.clear();
            goTo(LoginView(), canPop: false);
          }
        },
        child: Row(
          children: [
            AppImage(imageUrl: urlIcon, width: 18.w, height: 18.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isLogout ? Colors.red : const Color(0xff434C6D),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isLogout) {
                  await CacheHelper.clear();
                  goTo(LoginView(), canPop: false);
                }
              },
              icon: !isLogout
                  ? AppImage(
                      imageUrl: 'arrow_right.svg',
                      width: 24.w,
                      height: 24.h,
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
