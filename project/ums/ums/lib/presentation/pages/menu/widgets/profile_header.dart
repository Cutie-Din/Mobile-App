import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), // Set the bottom left corner radius
          bottomRight: Radius.circular(20), // Set the bottom right corner radius
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.main,
              child: Icon(
                Icons.person,
                color: AppColors.bg,
                size: 50,
              ),
            ),
            const SizedBox(width: AppSizes.sm * 1.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Xin chào, Nguyễn Quang H',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: AppFonts.fontSizeSm * 1.2,
                    fontWeight: AppFonts.bold,
                    color: AppColors.main,
                  ),
                ),
                Text(
                  'CNTT D2020B',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: AppFonts.fontSizeSm,
                    fontWeight: AppFonts.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Updated IconButton with notification bell and badge
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
                  right: 5,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.err,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16.5,
                      minHeight: 16.5,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 10,
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
