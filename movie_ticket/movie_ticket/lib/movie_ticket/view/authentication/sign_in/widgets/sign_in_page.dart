import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_ticket/util/constants/images_strings.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/fonts.dart';
import '../../../../../util/constants/icon&ill_strings.dart';
import '../../../../../util/constants/sizes.dart';
import '../../../../../util/constants/text_strings.dart';

class SignInPage extends StatefulWidget {
  final String image, subtitle;

  const SignInPage({
    super.key,
    required this.image,
    required this.subtitle,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  // Controllers to track text input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to check if both fields have text
  bool get _hasTextInFields {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to detect changes in text fields
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    // Calls setState when text is updated to refresh the button color
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSizes.onBoarding_1 * 1.4,
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: SvgPicture.asset(
                AppIll.ill_Logo,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Text(
              AppText.signIn_Title_1 + "\n" + AppText.signIn_Title_2,
              style: TextStyle(
                color: AppColors.whiteBgr,
                fontFamily: "Montserrat",
                fontSize: AppSizes.fontSizeLg,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            // Email TextFormField with dynamic floating label color
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isEmailFocused = hasFocus;
                });
              },
              child: TextFormField(
                controller: emailController, // Attach controller
                decoration: InputDecoration(
                  labelText: AppText.signIn_Email,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                  hintStyle: const TextStyle(color: Colors.white70),
                  floatingLabelStyle: TextStyle(
                    color: isEmailFocused ? AppColors.mainColor : Colors.white,
                    fontSize: AppSizes.fontSizeMd,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: false, // Remove background fill from TextFormField
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            // Password TextFormField with dynamic floating label color
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isPasswordFocused = hasFocus;
                });
              },
              child: TextFormField(
                controller: passwordController, // Attach controller
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppText.signIn_Pass,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                  hintStyle: const TextStyle(color: Colors.white70),
                  floatingLabelStyle: TextStyle(
                    color:
                        isPasswordFocused ? AppColors.mainColor : Colors.white,
                    fontSize: AppSizes.fontSizeMd,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: false, // Remove background fill from TextFormField
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forget password action here
                  },
                  child: Text(
                    AppText.signIn_Forgot,
                    style: TextStyle(
                      color: AppColors.whiteBgr,
                      fontFamily: "Montserrat",
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: AppFonts.semiBold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields * 2,
            ),
            Center(
              child: SizedBox(
                width: 255,
                height: 61,
                child: ElevatedButton(
                  onPressed: _hasTextInFields
                      ? () {
                          // Handle button press
                        }
                      : null, // Disable button if fields are empty
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (!states.contains(WidgetState.disabled)) {
                          return AppColors.mainColor;
                        }
                        return AppColors.darkBgr_2;
                      },
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    AppText.signIn_Login,
                    style: TextStyle(
                      color: AppColors.whiteBgr,
                      fontFamily: "Montserrat",
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.signIn_Create + " ",
                  style: TextStyle(
                    color: AppColors.greyBgr_1,
                    fontFamily: "Montserrat",
                    fontSize: AppSizes.fontSizeSm,
                    fontWeight: AppFonts.regular,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: GradientText(
                    AppText.signIn_SignUp_nav,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: AppFonts.regular,
                    ),
                    colors: [
                      Color(0xFF449EFF),
                      Color(0xFF1DC7F7),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: SvgPicture.asset(
                    AppImages.google,
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwItems * 2.5,
                ),
                SizedBox(
                  height: 64,
                  width: 64,
                  child: SvgPicture.asset(
                    AppImages.fb,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
