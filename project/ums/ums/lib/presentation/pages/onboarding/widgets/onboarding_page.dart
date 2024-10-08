import 'package:flutter/material.dart';
import 'package:ums/core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/sizes.dart';

class OnboardingPage extends StatelessWidget {
  final String description;
  final String gifFile; // Updated to gifFile
  final VoidCallback onNext;
  final bool isLastPage; // Variable to determine if this is the last page

  const OnboardingPage({
    required this.description,
    required this.gifFile, // Changed from svgFile to gifFile
    required this.onNext,
    required this.isLastPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color to white
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeLg,
              fontWeight: AppFonts.bold,
              color: AppColors.main,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.sm * 4),
          Image.asset(
            gifFile, // Use gifFile for loading GIFs
          ),
          const SizedBox(height: AppSizes.xl),
          SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
              onPressed: onNext, // Call onNext function when button is pressed
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.main,
                padding: EdgeInsets.zero,
              ),
              child: Icon(
                isLastPage ? Icons.check : Icons.arrow_forward, // Check mark if it's the last page
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
