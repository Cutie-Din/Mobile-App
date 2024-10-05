import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSizes.sm * 16.5,
        ),
        SvgPicture.asset(
          AppImg.logo,
          width: 150,
          height: 150,
          color: AppColors.bg,
        ),
        const SizedBox(
          height: AppSizes.sm * 5,
        ),
        Text(
          AppText.forgot,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: AppFonts.fontSizeLg,
            fontWeight: AppFonts.bold,
            color: AppColors.bg,
          ),
        ),
      ],
    );
  }
}
