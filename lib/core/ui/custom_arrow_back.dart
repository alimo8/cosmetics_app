import 'package:cosmetics/core/ui/app_image.dart';
import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: CircleAvatar(
        backgroundColor: Color(0xff101010).withValues(alpha: .1),
        child: AppImage(imageUrl: 'arrow_back.svg'),
      ),
    );
  }
}
