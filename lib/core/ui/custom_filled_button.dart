import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.color,
    required this.text,
    this.height,
    this.width,
    this.onPressed,
  });
  final Color? color;
  final String text;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(
          width ?? double.infinity, // default: full width
          height ?? 55, // default: 55 height
        ),
      ),
      child: Text(text),
    );
  }
}
