import 'dart:developer';

import 'package:cosmetics/core/logic/cach_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/auth/forget_password.dart';
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
  String? selectedCountryCode;
  final phoneController = TextEditingController(text: '01551713043');
  final passwordController = TextEditingController(text: '123456789');
  bool isLoginClicked = false;

  Future<bool> loginData() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    final response = await DioHelper.postRequest(
      endPoint: '/api/Auth/login',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );
    if (response.isSucces) {
      showMsg('Login Success');
      final model = UserData.fromJson(response.data);
      await CacheHelper.saveUserData(data: model);
      CacheHelper.setToken(model.token);
      return true;
    } else {
      showMsg(response.msg, isError: true);
      return false;
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 70.h),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImage(imageUrl: 'login.png'),
                SizedBox(height: 24.h),
                Text(
                  'Login Now',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Please enter the details below to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                ),
                SizedBox(height: 25.h),
                // Phone Input مع Country Code
                AppInput(
                  withCountryCode: true,
                  onCountryCodeChanged: (value) => selectedCountryCode = value,
                  keyboardType: TextInputType.number,
                  hintText: 'Phone Number',
                  labelText: 'Enter Your number',
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter value';
                    return null;
                  },
                ),
                SizedBox(height: 18.h),
                // ===== Password Input =====
                AppInput(
                  hintText: 'Your Password',
                  labelText: 'Enter Your Password',
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter value';
                    return null;
                  },
                ),

                // ===== Forget Password =====
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => goTo(ForgetPassword()),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: const Color(0xffD75D72),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),

                // ===== Login Button =====
                AppButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() => isLoginClicked = true);
                      final result = await loginData();
                      if (result) {
                        goTo(HomeView(), canPop: false);
                      }
                      setState(() => isLoginClicked = false);
                    }
                  },
                  text: 'Login',
                  color: const Color(0xffD75D72),
                  height: 60.h,
                  width: 268.w,
                  isLoading: isLoginClicked,
                ),
                SizedBox(height: 43.h),

                // ===== Register =====
                AppLoginOrRegister(),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserData {
  UserData({required this.token, required this.user});
  late final String token;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String? profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    countryCode = json['countryCode'] ?? '';
    role = json['role'] ?? '';
    profilePhotoUrl = json['profilePhotoUrl'] ?? '';
  }
}
