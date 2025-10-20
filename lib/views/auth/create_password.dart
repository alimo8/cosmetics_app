import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:cosmetics/views/auth/register.dart';
import 'package:flutter/material.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final formKey = GlobalKey<FormState>();

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
              AppAssets(imageUrl: 'splash_image.svg', width: 67, height: 70),
              SizedBox(height: 24),
              Text(
                'Create Password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              Text(
                textAlign: TextAlign.center,
                'The password should have at least 6 characters.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 25),

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
              SizedBox(height: 16),
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
              SizedBox(height: 70),
              CustomFilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Confirm',
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
