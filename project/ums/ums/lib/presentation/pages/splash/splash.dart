import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ums/core/constants/image_strings.dart';
import '../../../core/constants/colors.dart';
import '../onboarding/onBoarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SvgPicture.asset(AppImg.logo),
      ),
      duration: 1000,
      nextScreen: OnboardingScreen(), // Điều hướng tới OnboardingScreen
      backgroundColor: AppColors.bg,
      splashIconSize: 200,
    );
  }
}
