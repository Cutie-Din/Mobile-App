import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';

class MenuItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const MenuItem({required this.iconPath, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = AppDeviceUtils.screenWidth(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      child: Container(
        color: AppColors.bg,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenWidth * 0.02),
              CircleAvatar(
                backgroundColor: AppColors.main,
                radius: screenWidth * 0.09,
                child: SvgPicture.asset(
                  iconPath,
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.1,
                  color: AppColors.bg,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.main,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
