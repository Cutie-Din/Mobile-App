import 'package:flutter/material.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/fonts.dart';
import '../../../../util/constants/sizes.dart';
import '../../../../util/constants/text_strings.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 400),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/signIn');
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
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
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
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
            ),
          ),
        ],
      ),
    );
  }
}
