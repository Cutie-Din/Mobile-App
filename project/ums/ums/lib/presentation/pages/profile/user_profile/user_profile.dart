import 'package:flutter/material.dart';
import 'package:ums/presentation/pages/profile/user_profile/widgets/detail_button.dart';
import 'package:ums/presentation/pages/profile/user_profile/widgets/user_header.dart';
import 'package:ums/presentation/pages/profile/user_profile/widgets/user_info.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/device.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/text_strings.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDeviceUtils.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppText.ttsv,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: AppFonts.fontSizeMd,
            color: AppColors.bg,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.bg,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.main,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserHeader(),
              UserInfo(),
              DetailButton(),
            ],
          ),
        ),
      ),
    );
  }
}
