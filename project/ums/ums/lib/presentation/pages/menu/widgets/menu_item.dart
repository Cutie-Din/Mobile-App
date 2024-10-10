import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class MenuItem extends StatelessWidget {
  final String iconPath; // Path to the SVG asset
  final String label;

  const MenuItem({required this.iconPath, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Set the border radius to round the corners
      child: Container(
        color: AppColors.bg, // Set the background color
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
                child: SvgPicture.asset(
                  iconPath,
                  height: 40, // Adjust SVG height as needed
                  width: 40, // Adjust SVG width as needed
                  color: AppColors.bg, // Optionally set color if the SVG is monochrome
                ),
              ),
              const SizedBox(
                height: AppSizes.sm,
              ),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.main,
                  fontSize: 12,
                ), // Adjust text color to match the theme
              ),
            ],
          ),
        ),
      ),
    );
  }
}
