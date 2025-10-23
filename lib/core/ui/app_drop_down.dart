import 'package:flutter/material.dart';

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
      width: 70,
      child: DropdownButtonFormField<String>(
        value: initialValue ?? countryCodes.first,
        validator: validator,
        onChanged: onChanged,

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          filled: true,
          fillColor: Color(0xffD9D9D9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffD75D72), width: 1.5),
          ),
        ),

        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 18,
          color: Colors.grey,
        ),

        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10),

        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        items: countryCodes.map((code) {
          return DropdownMenuItem<String>(value: code, child: Text(code));
        }).toList(),
      ),
    );
  }
}
