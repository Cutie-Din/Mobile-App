// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/features/authentication/screens/password/forget_password.dart';
import 'package:budget_tracker/features/authentication/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.email,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields / 2,
            ),

            /// Remember & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(
                      AppTexts.rememberMe,
                      style: TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: Text(
                    AppTexts.forgetPassword,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
              ],
            ),

            /// Sign In
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppTexts.signIn),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            /// Create Account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(AppTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
