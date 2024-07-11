// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_tracker/common/widgets/login_signup/from_divider.dart';
import 'package:budget_tracker/common/widgets/login_signup/social_buttons.dart';
import 'package:budget_tracker/utils/constants/sizes.dart';
import 'package:budget_tracker/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                AppTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Form
              AppSignUpForm(dark: dark),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Divider
              AppFormDivider(
                dark: dark,
                dividerText: AppTexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Social
              const AppSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
