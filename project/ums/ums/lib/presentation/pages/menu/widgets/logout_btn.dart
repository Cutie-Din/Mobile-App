import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/constants/text_strings.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.err,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/sign-in');
        },
        child: const Text(
          AppText.menu_logOut,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: AppFonts.fontSizeMd,
            color: AppColors.bg,
          ),
        ),
      ),
    );
  }
}
