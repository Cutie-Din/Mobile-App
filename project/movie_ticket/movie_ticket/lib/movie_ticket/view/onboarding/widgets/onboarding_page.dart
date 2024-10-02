import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            height: AppSizes.onBoarding_1,
          ),
          const SizedBox(
            height: AppSizes.onBoarding_2,
          ),
          Center(
            child: SizedBox(child: SvgPicture.asset(AppIll.ill_Logo)),
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
          const SizedBox(height: 60),
          Container(
            height: 61,
            width: 255,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF449EFF),
                  Color(0xFF1DC7F7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                AppText.onBoarding_Button,
                style: TextStyle(
                  color: AppColors.whiteBgr,
                  fontFamily: "Montserrat",
                  fontSize: AppSizes.fontSizeSm,
                  fontWeight: AppFonts.regular,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
