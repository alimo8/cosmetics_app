import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatefulWidget {
  final bool isFormRegister;

  const SuccessDialog({super.key, required this.isFormRegister});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffD9D9D9),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.all(8.0.r),
        width: 360.w,
        height: 343.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(imageUrl: "verify.json", width: 70.w, height: 70.h),
            Text(
              !widget.isFormRegister
                  ? "  Password Created!"
                  : "Account Activated!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff434C6D),
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.h),

            Text(
              !widget.isFormRegister
                  ? 'Congratulations! Your password\n has been successfully created'
                  : 'Congratulations! Your account\nhas been successfully activated',
              style: TextStyle(
                color: Color(0xff8E8EA9),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20.h),
            AppButton(
              text: !widget.isFormRegister ? "Return to login" : "Go to home",
              onPressed: () {
                if (!widget.isFormRegister) {
                  goTo(LoginView(), canPop: false);
                } else {
                  goTo(HomeView(), canPop: false);
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
