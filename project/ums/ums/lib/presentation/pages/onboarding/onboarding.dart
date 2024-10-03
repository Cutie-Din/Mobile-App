import 'package:flutter/material.dart';
import 'widgets/onboarding_page.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/constants/image_strings.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: [
          OnboardingPage(
            description: AppText.demo,
            gifFile: AppImg.onboarding_1, // Update to use gifFile
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            isLastPage: false,
          ),
          OnboardingPage(
            description: AppText.demo,
            gifFile: AppImg.onboarding_2, // Update to use gifFile
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            isLastPage: false,
          ),
          OnboardingPage(
            description: AppText.demo,
            gifFile: AppImg.onboarding_3, // Update to use gifFile
            onNext: () {
              // Navigate to SignInScreen when onboarding is complete
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
            isLastPage: true,
          ),
        ],
      ),
    );
  }
}
