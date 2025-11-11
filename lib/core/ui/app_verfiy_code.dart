import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerfiyCode extends StatelessWidget {
  const AppVerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        fieldHeight: 55.h,
        fieldWidth: 50.w,
        activeColor: Colors.blue,
        selectedColor: Colors.pink,
        inactiveColor: Colors.grey,
      ),
      onChanged: (value) {
        // pinCode = value;
      },
    );
  }
}
