import 'package:flutter/material.dart';
import 'package:movie_ticket/movie_ticket/view/authentication/sign_in/widgets/sign_in_page.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/icon&ill_strings.dart';
import '../../../../util/constants/text_strings.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgr_1,
      body: Stack(
        children: [
          const SignInPage(
              image: AppIll.ill_Logo, subtitle: AppText.signIn_Title_1)
        ],
      ),
    );
  }
}
