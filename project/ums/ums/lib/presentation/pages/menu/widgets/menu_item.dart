import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: AppSizes.sm * 3),
        CircleAvatar(
          backgroundColor: AppColors.bg,
          radius: 35,
          child: Icon(icon, color: AppColors.main, size: 50),
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          label,
          style: TextStyle(color: AppColors.bg, fontSize: 12),
        ),
      ],
    );
  }
}
