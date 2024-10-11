import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/sizes.dart';

class OnboardingPage extends StatelessWidget {
  final String description;
  final String gifFile;
  final VoidCallback onNext;
  final bool isLastPage;

  const OnboardingPage({
    required this.description,
    required this.gifFile,
    required this.onNext,
    required this.isLastPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sử dụng AppDeviceUtils để lấy kích thước màn hình
    double screenWidth = AppDeviceUtils.screenWidth(context);
    double screenHeight = AppDeviceUtils.screenHeight(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: screenWidth * 0.1, // Responsive font size
              fontWeight: AppFonts.bold,
              color: AppColors.main,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05), // Responsive spacing
          Image.asset(
            gifFile,
            width: screenWidth * 0.9, // Responsive image width
            height: screenHeight * 0.5, // Responsive image height
            fit: BoxFit.contain,
          ),
          SizedBox(height: screenHeight * 0.05), // Responsive spacing
          SizedBox(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.main,
                padding: EdgeInsets.zero,
              ),
              child: Icon(
                isLastPage ? Icons.check : Icons.arrow_forward,
                color: Colors.white,
                size: screenWidth * 0.1, // Responsive icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
