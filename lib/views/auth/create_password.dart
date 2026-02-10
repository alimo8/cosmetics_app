import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/views/auth/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({
    super.key,
    required this.isFromRegister,
    required this.phone,
    required this.countryCode,
  });
  final bool isFromRegister;
  final String phone;
  final String countryCode;
  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  late final String phone = widget.phone;
  late final String selectedCountryCode = widget.countryCode;

  bool isLoading = false;
  late final bool isFromRegister = widget.isFromRegister;

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    if (passwordController.text != newPasswordController.text) {
      showMsg('Passwords do not match', isError: true);
      return;
    }

    setState(() => isLoading = true);

    final response = await DioHelper.postRequest(
      endPoint: '/api/Auth/reset-password',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "newPassword": passwordController.text.trim(),
        "confirmPassword": newPasswordController.text.trim(),
      },
    );

    setState(() => isLoading = false);

    if (response.isSucces) {
      await showDialog(
        context: context,
        builder: (_) => SuccessDialog(isFormRegister: isFromRegister),
      );
    } else {
      showMsg(response.msg, isError: true);
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w).copyWith(top: 100.h),
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
                onPressed: resetPassword,
                text: 'Confirm',
                isLoading: isLoading,
                color: Color(0xffD75D72),
                height: 60.h,
                width: 268.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
