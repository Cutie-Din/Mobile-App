import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/sizes.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = AppDeviceUtils.screenWidth(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth * 0.05),
          bottomRight: Radius.circular(screenWidth * 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.08,
              backgroundColor: AppColors.main,
              child: Icon(
                Icons.person,
                color: AppColors.bg,
                size: screenWidth * 0.1,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xin chào, Nguyễn Văn A',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: screenWidth * 0.04,
                    fontWeight: AppFonts.bold,
                    color: AppColors.main,
                  ),
                ),
                Text(
                  'CNTT D2020B',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: screenWidth * 0.03,
                    fontWeight: AppFonts.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Spacer(),
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.main,
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: AppColors.bg),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  right: screenWidth * 0.015,
                  top: screenWidth * 0.02,
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: AppColors.err,
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    ),
                    constraints: BoxConstraints(
                      minWidth: screenWidth * 0.045,
                      minHeight: screenWidth * 0.045,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: screenWidth * 0.025,
                        fontWeight: AppFonts.bold,
                        color: AppColors.bg,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
