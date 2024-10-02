// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:budget_tracker/common/styles/spacing_styles.dart';
import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../common/widgets/login_signup/from_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title and sub-Title
              AppLoginHeader(),

              /// Form
              AppLoginForm(dark: dark),

              /// Divider
              AppFormDivider(
                dark: dark,
                dividerText: AppTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Footer
              AppSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
