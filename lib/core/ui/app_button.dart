import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color,
    required this.text,
    this.height,
    this.width,
    this.onPressed,
    this.isLoading = false,
  });
  final Color? color;
  final String text;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? () {} : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        visualDensity: VisualDensity.compact,
        fixedSize: Size(
          width ?? double.infinity, // default: full width
          height ?? 55, // default: 55 height
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(text),
    );
  }
}
