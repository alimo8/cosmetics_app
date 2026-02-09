import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerfiyCode extends StatelessWidget {
  const AppVerfiyCode({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controller,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      cursorColor: Colors.black,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        fieldHeight: 55.h,
        fieldWidth: 50.w,
        activeColor: Colors.blue,
        selectedColor: Colors.pink,
        inactiveColor: Colors.grey,
        errorBorderColor: Colors.red,
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter verification code';
        }
      },

      onCompleted: (value) {
        // FocusScope.of(context).unfocus();
        if (formKey.currentState!.validate()) {
          onSubmit();
        }
      },
    );
  }
}
