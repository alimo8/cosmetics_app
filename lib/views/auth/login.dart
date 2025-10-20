import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/custom_drop_down_widget.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:cosmetics/views/auth/reset_password.dart';
import 'package:flutter/material.dart';

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
            horizontal: 40.0,
          ).copyWith(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets(imageUrl: 'login_img.png'),
              SizedBox(height: 24),
              Text(
                'Login Now',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              Text(
                textAlign: TextAlign.center,
                'Please enter the details below to continue',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 25),
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
                  SizedBox(width: 10),
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
              SizedBox(height: 18),

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
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 43),
              CustomFilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Login',
                color: Color(0xffD75D72),
                height: 60,
                width: 268,
              ),
              SizedBox(height: 43),
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
