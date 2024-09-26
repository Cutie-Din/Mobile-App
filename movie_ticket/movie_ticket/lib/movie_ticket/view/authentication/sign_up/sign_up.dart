import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/sign_up/widgets/sign_up_page.dart';
import 'package:movie_ticket/util/constants/icon&ill_strings.dart';
import 'package:movie_ticket/util/constants/images_strings.dart';

import '../../../../util/constants/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.darkBgr_1,
        ),
        backgroundColor: AppColors.darkBgr_1,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            AppIcon.icon_back,
          ),
        ),
      ),
      backgroundColor: AppColors.darkBgr_1,
      body: Stack(
        children: [
          const SignUpPage(),
        ],
      ),
    );
  }
}
