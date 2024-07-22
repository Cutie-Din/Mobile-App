// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:budget_tracker/features/authentication/controller/login_controller.dart';
import 'package:budget_tracker/features/authentication/screens/password/forget_password.dart';
import 'package:budget_tracker/features/authentication/screens/signup/signup.dart';

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
  LoginController loginController = Get.put(LoginController());
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
              controller: loginController.eOrPController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.eOrp,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: loginController.passwordController,
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
                onPressed: () => loginController.login(),
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
