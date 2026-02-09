import 'package:cosmetics/views/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  String? selectedCountryCode;
  bool isLoading = false;

  Future<void> sendOtp() async {
    if (phoneController.text.trim().isEmpty) return;

    setState(() => isLoading = true);
    final response = await DioHelper.postRequest(
      endPoint: '/api/Auth/forgot-password',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phoneController.text.trim(),
      },
    );
    setState(() => isLoading = false);

    if (response.isSucces) {
      goTo(
        OtpView(
          isFromRegister: false,
          countryCode: selectedCountryCode!,
          phoneNumber: phoneController.text.trim(),
        ),
      );
    } else {
      showMsg(response.msg, isError: true);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
          child: Column(
            children: [
              AppImage(imageUrl: 'splash.svg', width: 67.w, height: 70.h),
              SizedBox(height: 24.h),
              Text(
                'Forget password',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.h),
              Text(
                textAlign: TextAlign.center,
                'Please enter your phone number below to recovery your password.',
                style: TextStyle(color: Color(0xff8E8EA9), fontSize: 14.sp),
              ),
              SizedBox(height: 45.h),
              AppInput(
                hintText: 'Phone Number',
                labelText: 'Enter Your number',
                controller: phoneController,
                withCountryCode: true,
                onCountryCodeChanged: (v) => selectedCountryCode = v,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 43.h),
              AppButton(
                text: 'Next',
                isLoading: isLoading,
                color: Color(0xffD75D72),
                height: 60.h,
                width: 268.w,
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                  sendOtp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
