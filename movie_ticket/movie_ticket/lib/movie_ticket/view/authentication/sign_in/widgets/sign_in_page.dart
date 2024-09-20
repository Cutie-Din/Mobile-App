import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/fonts.dart';
import '../../../../../util/constants/icon&ill_strings.dart';
import '../../../../../util/constants/sizes.dart';
import '../../../../../util/constants/text_strings.dart';

class SignInPage extends StatelessWidget {
  final String image, subtitle;
  const SignInPage({
    super.key,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align all children to the left
          children: [
            const SizedBox(
              height: AppSizes.onBoarding_1,
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: SvgPicture.asset(
                AppIll.ill_Logo,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Text(
              AppText.signIn_Title_1 + "\n" + AppText.signIn_Title_2,
              textAlign: TextAlign.left, // Align text to the left
              style: TextStyle(
                color: AppColors.whiteBgr,
                fontFamily: "Montserrat",
                fontSize: AppSizes.fontSizeLg,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
