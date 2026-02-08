import 'package:cosmetics/core/ui/app_image.dart';
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
    this.icon,
  });
  final Color? color;
  final String text;
  final String? icon;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: icon != null ? AppImage(imageUrl: icon!) : null,
      onPressed: isLoading ? () {} : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        visualDensity: VisualDensity.compact,
        fixedSize: Size(width ?? double.infinity, height ?? 55),
      ),
      label: isLoading
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
