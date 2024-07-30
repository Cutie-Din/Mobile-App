// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:budget_tracker/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(child: LottieBuilder.asset("assets/logos/splash.json"))
        ],
      ),
      duration: 2200,
      nextScreen: const Onboarding(),
      splashIconSize: 450,
      backgroundColor: AppColors.primaryBackground,
    );
  }
}
