import 'package:flutter/material.dart';
import 'package:movie_ticket/movie_ticket/view/onboarding/widgets/onboarding_button.dart';
import 'package:movie_ticket/movie_ticket/view/onboarding/widgets/onboarding_page.dart';
import 'package:movie_ticket/util/constants/colors.dart';
import 'package:movie_ticket/util/constants/icon&ill_strings.dart';
import 'package:movie_ticket/util/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgr_1,
      body: Stack(
        children: [
          const OnboardingPage(
            image: AppIll.ill_Logo,
            title: AppText.onBoarding_Title,
            subtitle: AppText.onBoarding_Subtitle,
          ),
          const OnboardingButton(),
        ],
      ),
    );
  }
}
