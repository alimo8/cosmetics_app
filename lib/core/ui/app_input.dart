import 'package:cosmetics/core/ui/app_country_code.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.radius,
    this.withCountryCode = false,
    this.onCountryCodeChanged,
  });

  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool withCountryCode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final double? radius;
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.withCountryCode)
          AppCountryCode(onCountryCodeChanged: widget.onCountryCodeChanged),
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            obscureText: widget.isPassword && isShown,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: Colors.grey),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      focusNode: FocusNode(skipTraversal: true),
                      onPressed: () {
                        setState(() {
                          isShown = !isShown;
                        });
                      },
                      icon: AppImage(
                        imageUrl: 'eye_${isShown ? "off" : "on"}.svg',
                      ),
                    )
                  : widget.suffixIcon,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder? get border {
    if (widget.radius == null) return null;
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(widget.radius!),
    );
  }
}
