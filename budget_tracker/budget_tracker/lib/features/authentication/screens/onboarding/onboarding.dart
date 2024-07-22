// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:budget_tracker/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../controller/onboarding_controller.dart';
import 'widgets/onboarding_dotnavigation.dart';
import 'widgets/onboarding_nextbutton.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Hiển thị theo chiều dọc
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
            ],
          ),

          /// Nút skip
          const OnBoardingSkip(),

          /// Dấu chuyển trang
          const OnBoardingDotNavigation(),

          /// Nút chuyển trang
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
