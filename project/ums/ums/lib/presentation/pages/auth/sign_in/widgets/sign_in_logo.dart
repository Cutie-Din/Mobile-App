import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context); // Get screen width

    return Column(
      children: [
        SizedBox(
          height: AppSizes.sm * 8,
        ),
        SvgPicture.asset(
          AppImg.logo,
          width: screenWidth * 0.3, // Responsive width
          height: screenWidth * 0.3, // Responsive height
          color: AppColors.bg,
        ),
        SizedBox(
          height: AppSizes.sm * 1.5,
        ),
        Text(
          AppText.sign_In,
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
