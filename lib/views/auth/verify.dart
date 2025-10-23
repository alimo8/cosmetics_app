import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

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
            Text(
              textAlign: TextAlign.center,
              'We just sent a 4-digit verification code to +20 1022658997. Enter the code in the box below to continue.',
              style: TextStyle(fontSize: 15.sp, color: Colors.grey),
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
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
            PinCodeTextField(
              appContext: context,
              length: 4,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12.r),
                fieldHeight: 55.h,
                fieldWidth: 50.w,
                activeColor: Colors.blue,
                selectedColor: Colors.pink,
                inactiveColor: Colors.grey,
              ),
              onChanged: (value) {
                // pinCode = value;
              },
            ),
            SizedBox(height: 50.h),
            AppButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {}
                // goTo(CreatePasswordView());
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: AppImage(
                        imageUrl: 'verify.json',
                        height: 100.h,
                        width: 100.w,
                      ),
                      title: Text('Account Activated!'),
                      content: Text(
                        textAlign: TextAlign.center,
                        'Congratulations! Your account has been successfully activated',
                        style: TextStyle(color: Colors.grey),
                      ),
                      actions: [
                        Center(
                          child: AppButton(
                            height: 60.h,
                            width: 268.w,
                            text: 'Go to home',
                            onPressed: () {
                              goTo(HomeView(), canPop: false);
                            },
                            color: Color(0xffD75D72),
                          ),
                        ),
                      ],
                    );
                  },
                );
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
