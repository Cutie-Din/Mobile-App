import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_ticket/movie_ticket/view/onboarding/onboarding.dart';
import 'package:movie_ticket/util/constants/icon&ill_strings.dart';

import 'util/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Center(
          child: SvgPicture.asset(AppIll.ill_Logo),
        ),
        duration: 1500,
        nextScreen: const OnboardingScreen(),
        backgroundColor: AppColors.darkBgr_1,
        splashIconSize: 150,
      ),
    );
  }
}
