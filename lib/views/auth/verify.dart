import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_resend_otp.dart';
import 'package:cosmetics/core/ui/app_verfiy_code.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key, required this.isFromRegister});
  final bool isFromRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ).copyWith(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(imageUrl: 'splash.svg', height: 67.h, width: 62.w),
            SizedBox(height: 40.h),
            Text(
              'Verify Code',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'We just sent a 4-digit verification code to ',
                  ),
                  TextSpan(
                    text: '\n+20 1551713043.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' Enter the code in the box below to continue.',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Edit the number',
                  style: TextStyle(
                    color: Color(0xffD75D72),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AppVerfiyCode(),
            AppResendOtp(),
            SizedBox(height: 50.h),
            AppButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {}
                if (isFromRegister) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        SuccessDialog(isFormRegister: isFromRegister),
                  );
                } else {
                  goTo(CreatePasswordView());
                }
              },
              text: 'Done',
              color: Color(0xffD75D72),
              height: 60.h,
              width: 268.w,
            ),
            SizedBox(height: 43.h),
          ],
        ),
      ),
    );
  }
}
