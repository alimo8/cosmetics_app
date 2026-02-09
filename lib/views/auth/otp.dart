import 'package:cosmetics/core/ui/app_back.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_verfiy_code.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'create_password.dart';
import 'success_dialog.dart';

class OtpView extends StatefulWidget {
  const OtpView({
    super.key,
    required this.isFromRegister,
    required this.countryCode,
    required this.phoneNumber,
  });

  final bool isFromRegister;
  final String countryCode;
  final String phoneNumber;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  bool isLoading = false;

  bool get isFromRegister => widget.isFromRegister;
  String get countryCode => widget.countryCode;
  String get phoneNumber => widget.phoneNumber;

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();
    if (otp.length < 4) return;

    setState(() => isLoading = true);
    final response = await DioHelper.postRequest(
      endPoint: '/api/Auth/verify-otp',
      data: {
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "otpCode": otp,
      },
    );
    setState(() => isLoading = false);

    if (response.isSucces) {
      if (isFromRegister) {
        showDialog(
          context: context,
          builder: (_) => SuccessDialog(isFormRegister: true),
        );
      } else {
        goTo(CreatePasswordView());
      }
    } else {
      showMsg(response.msg, isError: true);
    }
  }

  // @override
  // void dispose() {
  //   otpController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBack(paddingStart: 16.r)),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
          child: Column(
            children: [
              AppImage(imageUrl: 'splash.svg', height: 67.h, width: 62.w),
              SizedBox(height: 40.h),
              Text(
                'Verify Code',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We just sent a 4-digit verification code to ',
                    ),
                    TextSpan(
                      text: '\n+20 1551713043.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff434C6D),
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
              SizedBox(height: 30.h),

              AppVerfiyCode(
                controller: otpController,
                formKey: formKey,
                onSubmit: verifyOtp,
              ),
              SizedBox(height: 40.h),
              AppButton(
                text: 'Done',
                isLoading: isLoading,
                color: Color(0xffD75D72),
                height: 60.h,
                width: 268.w,
                onPressed: verifyOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
