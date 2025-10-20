import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/ui/app_assets.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/custom_drop_down_widget.dart';
import 'package:cosmetics/core/ui/custom_filled_button.dart';
import 'package:cosmetics/views/auth/verify.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

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
                'Reset password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 14),
              Text(
                textAlign: TextAlign.center,
                'Please enter your phone number below to recovery your password.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 100),
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

              SizedBox(height: 43),
              CustomFilledButton(
                onPressed: () {
                  goTo(VerifyView());

                  // if (formKey.currentState!.validate()) {
                  // }
                },
                text: 'Login',
                color: Color(0xffD75D72),
                height: 60,
                width: 268,
              ),
              SizedBox(height: 43),
            ],
          ),
        ),
      ),
    );
  }
}
