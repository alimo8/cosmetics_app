import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_drop_down.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:cosmetics/views/auth/reset_password.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ).copyWith(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(imageUrl: 'login.png'),
              SizedBox(height: 24.h),
              Text(
                'Login Now',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.h),
              Text(
                textAlign: TextAlign.center,
                'Please enter the details below to continue',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  AppDropDown(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a country code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(width: 10.w),
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
              SizedBox(height: 18.h),
              AppInput(
                hintText: 'Your Password',
                labelText: 'Enter Your Password',
                isPassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    goTo(ResetPasswordView());
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Color(0xffD75D72),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 30.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    goTo(HomeView(), canPop: false);
                  }
                },
                text: 'Login',
                color: Color(0xffD75D72),
                height: 60.h,
                width: 268.w,
              ),
              SizedBox(height: 43.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account?',
                      style: TextStyle(color: Colors.grey),
                      children: [],
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        onPressed: () {
                          goTo(RegisterView());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Color(0xffD75D72)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
