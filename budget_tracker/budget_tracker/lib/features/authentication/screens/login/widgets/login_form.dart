// ignore_for_file: prefer_const_constructors

import 'package:budget_tracker/features/authentication/screens/password/forget_password.dart';
import 'package:budget_tracker/features/authentication/screens/signup/signup.dart';
import 'package:budget_tracker/features/personalization/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginForm extends StatefulWidget {
  AppLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  State<AppLoginForm> createState() => _AppLoginFormState();
}

class _AppLoginFormState extends State<AppLoginForm> {
  bool _isChecked = false;
  bool _isVisible = false;

  void _handleRememberMeChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

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
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isVisible ? Iconsax.eye : Iconsax.eye_slash,
                  ),
                  onPressed: _toggleVisibility,
                ),
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
                      value: _isChecked,
                      onChanged: _handleRememberMeChange,
                    ),
                    const Text(
                      AppTexts.rememberMe,
                    ),
                  ],
                ),

                /// Forget Password
                Flexible(
                  child: TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(
                      AppTexts.forgetPassword,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),

            /// Sign In
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const HomeScreen()),
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
