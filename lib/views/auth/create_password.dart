import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ).copyWith(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(imageUrl: 'splash.svg', width: 67.w, height: 70.h),
              SizedBox(height: 24.h),
              Text(
                'Create Password',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14.h),
              Text(
                textAlign: TextAlign.center,
                'The password should have at least 6 characters.',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
              ),
              SizedBox(height: 25.h),
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
              SizedBox(height: 16.h),
              AppInput(
                hintText: 'Your Password',
                labelText: 'Enter Your Password',
                isPassword: true,
                controller: newPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 70.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          SuccessDialog(isFormRegister: false),
                    );
                  }
                },
                text: 'Confirm',
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
