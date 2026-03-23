import 'package:filmku/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 133,
          decoration: BoxDecoration(color: Color(0xFFF9F9FA)),
        ),
        Container(
          width: 133,
          decoration: BoxDecoration(color: AppColors.background),
        ),
      ],
    );
  }
}
