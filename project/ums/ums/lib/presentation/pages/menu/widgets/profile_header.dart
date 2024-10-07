import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/image_strings.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.bg,
            // child: SvgPicture.asset(
            //   AppImg.avatar, // The path to your SVG image
            //   width: 50,
            //   height: 50,
            //   fit: BoxFit.cover,
            //   color: AppColors.main,
            // ),
            child: Icon(
              Icons.person,
              color: AppColors.main,
              size: 50,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Xin chào, Nguyễn Văn A',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: AppFonts.fontSizeSm * 1.25,
                  fontWeight: AppFonts.bold,
                  color: AppColors.bg,
                ),
              ),
              Text(
                'CNTT D2020B',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: AppFonts.fontSizeSm,
                  fontWeight: AppFonts.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Spacer(),
          // Updated IconButton with notification bell and badge
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.bg,
                child: IconButton(
                  icon: Icon(Icons.notifications, color: AppColors.main),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 5,
                top: 6,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.err,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16.5,
                    minHeight: 16.5,
                  ),
                  child: Text(
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
    );
  }
}
