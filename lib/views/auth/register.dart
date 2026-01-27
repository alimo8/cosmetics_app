import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_login_or_register.dart';
import 'package:cosmetics/views/home/view.dart';
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
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String? selectedCountryCode;
  bool isRegisteredClicked = false;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(imageUrl: 'splash.svg', height: 67.h, width: 62.w),
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
              AppInput(
                hintText: 'Enter Your Email',
                labelText: 'Your Email',
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              AppInput(
                withCountryCode: true,
                onCountryCodeChanged: (value) => selectedCountryCode = value,
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
              SizedBox(height: 16.h),

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
              SizedBox(height: 40.h),

              AppButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isRegisteredClicked = true;
                    });
                    final result = await registerData();
                    if (result) {
                      goTo(HomeView(), canPop: false);
                    }
                    setState(() {
                      isRegisteredClicked = false;
                    });
                    // goTo(VerifyView(isFromRegister: true));
                  }
                },
                text: 'Next',
                color: Color(0xffD75D72),
                height: 60,
                width: 268,
                isLoading: isRegisteredClicked,
              ),
              SizedBox(height: 43.h),
              AppLoginOrRegister(isLogin: false),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
