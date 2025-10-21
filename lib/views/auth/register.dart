import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/custom_drop_down_widget.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets(
                imageUrl: 'splash_image.svg',
                height: 67.h,
                width: 62.w,
              ),
              SizedBox(height: 40.h),
              Text(
                'Create account',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.h),

              AppInput(
                hintText: 'Enter Your Name',
                labelText: 'Your Name',
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  CustomDropDownWidget(
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
                      hintText: 'Enter Phone Number',
                      labelText: 'Phone Number',
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
              SizedBox(height: 16.h),

              AppInput(
                hintText: 'Enter Your Password',
                labelText: 'Create your password',
                isPassword: true,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              AppInput(
                hintText: 'Enter Your Password',
                labelText: 'Confirm your password',
                isPassword: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 90.h),

              CustomFilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Next',
                color: Color(0xffD75D72),
                height: 60,
                width: 268,
              ),
              SizedBox(height: 43.h),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xffD75D72)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
