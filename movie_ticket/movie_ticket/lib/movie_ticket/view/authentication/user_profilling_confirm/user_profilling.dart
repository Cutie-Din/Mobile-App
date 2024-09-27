import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/user_profilling_confirm/widgets/user_profilling_page.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/icon&ill_strings.dart';

class UserProfillingScreen extends StatelessWidget {
  const UserProfillingScreen({super.key});

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
          const UserProfillingPage(),
        ],
      ),
    );
  }
}
