import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.validator,
    this.onChanged,
    this.initialValue,
  });

  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final String? initialValue;

  final List<String> countryCodes = const ['+20', '+999', '+966', '+44'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: DropdownButtonFormField<String>(
        value: initialValue ?? countryCodes.first,
        validator: validator,
        onChanged: onChanged,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          filled: true,
          fillColor: Color(0xffD9D9D9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.grey, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffD75D72), width: 1.5.w),
          ),
        ),

        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 18.sp,
          color: Colors.grey,
        ),

        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10.r),

        style: TextStyle(
          color: Colors.black87,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),

        items: countryCodes.map((code) {
          return DropdownMenuItem<String>(value: code, child: Text(code));
        }).toList(),
      ),
    );
  }
}
