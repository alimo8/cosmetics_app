import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages extends StatelessWidget {
  const AppImages({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.color,
  });
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.toLowerCase().endsWith('svg')) {
      return SvgPicture.asset(
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.error_outline, color: Colors.red),
        'assets/icons/$imageUrl',
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    } else if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.error_outline, color: Colors.red),
      );
    }

    return Image.asset(
      'assets/images/$imageUrl',
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.error_outline, color: Colors.red),
    );
  }
}
