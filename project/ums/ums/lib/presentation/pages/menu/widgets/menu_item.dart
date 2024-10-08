import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Set the border radius to round the corners
      child: Container(
        color: AppColors.bg, // Set the background color to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space the items evenly
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: AppSizes.sm,
              ),
              CircleAvatar(
                backgroundColor: AppColors.main, // Set the CircleAvatar's background color
                radius: 35,
                child: Icon(icon, color: AppColors.bg, size: 50),
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              Text(
                label,
                style: TextStyle(
                    color: AppColors.main, fontSize: 12), // Adjust text color to match the theme
              ),
            ],
          ),
        ),
      ),
    );
  }
}
