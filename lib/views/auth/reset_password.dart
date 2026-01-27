import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_back.dart';
import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/views/auth/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.r).copyWith(top: 48.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBack(),
              SizedBox(height: 40.h),
              AppImage(imageUrl: 'splash.svg', width: 67.w, height: 70.h),
              SizedBox(height: 24.h),
              Text(
                'Reset password',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.h),
              Text(
                textAlign: TextAlign.center,
                'Please enter your phone number below to recovery your password.',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
              ),
              SizedBox(height: 100.h),
              Row(
                children: [
                  AppCountryCode(),
                  SizedBox(width: 10.h),
                  Flexible(
                    flex: 4,
                    child: AppInput(
                      keyboardType: TextInputType.number,
                      hintText: 'Phone Number',
                      labelText: 'Enter Your number',
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 43.h),
              AppButton(
                onPressed: () {
                  goTo(VerifyView(isFromRegister: false));
                },
                text: 'Login',
                color: Color(0xffD75D72),
                height: 60,
                width: 268,
              ),
              SizedBox(height: 43.h),
            ],
          ),
        ),
      ),
    );
  }
}
