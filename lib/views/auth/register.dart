// import 'package:cosmetics/core/logic/helper_methods.dart';
// import 'package:cosmetics/core/networking/dio_helper.dart';
// import 'package:cosmetics/core/ui/app_image.dart';
// import 'package:cosmetics/core/ui/app_input.dart';
// import 'package:cosmetics/core/ui/app_button.dart';
// import 'package:cosmetics/core/ui/app_login_or_register.dart';
// import 'package:cosmetics/views/auth/otp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController(text: 'Ali_Mohamedd');
//   final emailController = TextEditingController(text: 'ali5553754@gmail.com9');
//   final phoneController = TextEditingController(text: '015517130439');
//   final passwordController = TextEditingController(text: '123456789');
//   final confirmPasswordController = TextEditingController(text: '123456789');
//   String? selectedCountryCode;
//   bool isRegisteredClicked = false;

//   Future<bool> registerData() async {
//     final name = nameController.text.trim();
//     final email = emailController.text.trim();
//     final phone = phoneController.text.trim();
//     final password = passwordController.text.trim();
//     final confirmPassword = confirmPasswordController.text.trim();
//     if (password != confirmPassword) {
//       showMsg('Passwords do not match', isError: true);
//       return false;
//     }

//     final response = await DioHelper.postRequest(
//       endPoint: '/api/Auth/register',
//       data: {
//         "username": name,
//         "countryCode": selectedCountryCode,
//         "phoneNumber": phone,
//         "email": email,
//         "password": password,
//       },
//     );
//     if (response.isSucces) {
//       showMsg('Register Success');
//       return true;
//     } else {
//       showMsg(response.msg, isError: true);
//       return false;
//     }
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
//       body: Form(
//         key: formKey,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 40.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AppImage(imageUrl: 'splash.svg', height: 67.h, width: 62.w),
//               SizedBox(height: 40.h),
//               Text(
//                 'Create account',
//                 style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 50.h),

//               AppInput(
//                 hintText: 'Enter Your Name',
//                 labelText: 'Your Name',
//                 controller: nameController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter value';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               AppInput(
//                 hintText: 'Enter Your Email',
//                 labelText: 'Your Email',
//                 controller: emailController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter value';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               AppInput(
//                 withCountryCode: true,
//                 onCountryCodeChanged: (value) => selectedCountryCode = value,
//                 hintText: 'Enter Phone Number',
//                 labelText: 'Phone Number',
//                 controller: phoneController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter value';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),

//               AppInput(
//                 hintText: 'Enter Your Password',
//                 labelText: 'Create your password',
//                 isPassword: true,
//                 controller: passwordController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter value';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),

//               AppInput(
//                 hintText: 'Enter Your Password',
//                 labelText: 'Confirm your password',
//                 isPassword: true,
//                 controller: confirmPasswordController,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter value';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 40.h),

//               AppButton(
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     setState(() {
//                       isRegisteredClicked = true;
//                     });
//                     final result = await registerData();
//                     if (result) {
//                       goTo(
//                         OtpView(
//                           isFromRegister: true,
//                           countryCode: selectedCountryCode!,
//                           phoneNumber: phoneController.text.trim(),
//                         ),
//                         canPop: true,
//                       );
//                     }
//                     setState(() {
//                       isRegisteredClicked = false;
//                     });
//                     // goTo(VerifyView(isFromRegister: true));
//                   }
//                 },
//                 text: 'Next',
//                 color: Color(0xffD75D72),
//                 height: 60,
//                 width: 268,
//                 isLoading: isRegisteredClicked,
//               ),
//               SizedBox(height: 43.h),
//               AppLoginOrRegister(isLogin: false),
//               SizedBox(height: 16.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? selectedCountryCode;
  bool isLoading = false;

  Future<bool> registerData() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      showMsg('Passwords do not match', isError: true);
      return false;
    }

    final response = await DioHelper.postRequest(
      endPoint: '/api/Auth/register',
      data: {
        "username": name,
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "email": email,
        "password": password,
      },
    );

    if (response.isSucces) {
      showMsg('Register Success');
      return true;
    } else {
      showMsg(response.msg, isError: true);
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              AppImage(imageUrl: 'splash.svg', height: 67.h, width: 62.w),
              SizedBox(height: 40.h),
              Text(
                'Create account',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.h),

              AppInput(
                labelText: 'Your Name',
                hintText: 'Enter Your Name',
                controller: nameController,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
              ),
              SizedBox(height: 16.h),

              AppInput(
                labelText: 'Your Email',
                hintText: 'Enter Your Email',
                controller: emailController,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
              ),
              SizedBox(height: 16.h),

              AppInput(
                labelText: 'Phone Number',
                hintText: 'Enter Your Phone',
                controller: phoneController,
                withCountryCode: true,
                onCountryCodeChanged: (v) => selectedCountryCode = v,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.h),

              AppInput(
                labelText: 'Create Password',
                hintText: 'Enter Your Password',
                controller: passwordController,
                isPassword: true,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
              ),
              SizedBox(height: 16.h),

              AppInput(
                labelText: 'Confirm Password',
                hintText: 'Re-enter Password',
                controller: confirmPasswordController,
                isPassword: true,
                validator: (v) => v!.isEmpty ? 'Please enter value' : null,
              ),
              SizedBox(height: 40.h),

              AppButton(
                text: 'Next',
                isLoading: isLoading,
                color: Color(0xffD75D72),
                height: 60.h,
                width: 268.w,
                onPressed: () async {
                  if (formKey.currentState!.validate()) return;
                  setState(() => isLoading = true);
                  final success = await registerData();
                  setState(() => isLoading = false);
                  if (success) {
                    goTo(
                      OtpView(
                        isFromRegister: true,
                        countryCode: selectedCountryCode!,
                        phoneNumber: phoneController.text.trim(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 16.h),
              AppLoginOrRegister(isLogin: false),
            ],
          ),
        ),
      ),
    );
  }
}
