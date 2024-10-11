import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg package

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/device.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02), // Responsive vertical padding
      child: Column(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.12, // Responsive radius
            backgroundColor: AppColors.bg,
            child: ClipOval(
              child: SvgPicture.asset(
                AppImg.profile,
                width: screenWidth * 0.25, // Responsive width
                height: screenWidth * 0.25, // Responsive height
                fit: BoxFit.cover,
                color: AppColors.main,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.025), // Responsive spacing
          Text(
            'Nguyễn Văn A',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm * 2,
              fontWeight: AppFonts.bold,
              color: AppColors.bg,
            ),
          ),
          Text(
            '0000000',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm * 2,
              fontWeight: AppFonts.bold,
              color: AppColors.bg,
            ),
          ),
          Text(
            'Lớp: CNTT D2020B',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm,
              fontWeight: AppFonts.bold,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
