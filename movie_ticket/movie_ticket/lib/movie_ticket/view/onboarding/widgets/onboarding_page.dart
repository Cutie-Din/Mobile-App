import 'package:flutter/material.dart';
import 'package:movie_ticket/util/constants/colors.dart';
import 'package:movie_ticket/util/constants/fonts.dart';

import '../../../../util/constants/icon&ill_strings.dart';
import '../../../../util/constants/sizes.dart';
import '../../../../util/constants/text_strings.dart';
import '../../../../util/helpers/helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  final String image, title, subtitle;
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(
            height: AppSizes.onBoarding,
          ),
          Center(
            child: SizedBox(
              width: 223, // Set your desired width
              height: 223, // Set your desired height
              child: Image.asset(
                AppIll.ill_Logo,
              ), // Adjust fit as needed
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Text(
            AppText.onBoarding_Title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.whiteBgr,
              fontFamily: "Montserrat",
              fontSize: AppSizes.fontSizeLg,
              fontWeight: AppFonts.regular,
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Text(
            AppText.onBoarding_Subtitle_1 +
                "\n" +
                AppText.onBoarding_Subtitle_2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.greyBgr_3,
              fontFamily: "Montserrat",
              fontSize: AppSizes.fontSizeSm,
              fontWeight: AppFonts.regular,
            ),
          ),
        ],
      ),
    );
  }
}
