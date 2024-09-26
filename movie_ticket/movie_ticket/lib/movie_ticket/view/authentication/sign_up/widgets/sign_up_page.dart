import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../util/constants/colors.dart';
import '../../../../../util/constants/fonts.dart';
import '../../../../../util/constants/icon&ill_strings.dart';
import '../../../../../util/constants/sizes.dart';
import '../../../../../util/constants/text_strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isFullNameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;

  // Controllers to track text input
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Function to check if all fields have text
  bool get _hasTextInFields {
    return fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        _selectedImage != null;
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to detect changes in text fields
    fullNameController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    // Calls setState when text is updated to refresh the button color
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Store the picked image
  XFile? _selectedImage;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  // Function to remove the selected image
  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                AppText.signUp_create + "\n" + AppText.signUp_urAcc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteBgr,
                  fontFamily: "Montserrat",
                  fontSize: AppSizes.fontSizeLg,
                  fontWeight: AppFonts.semiBold,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Center(
              child: Stack(
                children: [
                  // Display avatar image or default icon
                  SizedBox(
                    height: 92,
                    width: 92,
                    child: CircleAvatar(
                      backgroundImage: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!.path),
                            ).image
                          : null,
                      child: _selectedImage == null
                          ? SvgPicture.asset(
                              AppIll.illProfile,
                            )
                          : null,
                    ),
                  ),

                  GestureDetector(
                    onTap: _selectedImage == null ? _pickImage : _removeImage,
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: CircleAvatar(
                        backgroundColor: _selectedImage == null
                            ? AppColors.mainColor
                            : AppColors.error,
                        child: SvgPicture.asset(
                          _selectedImage == null
                              ? AppIcon.icon_add
                              : AppIcon.icon_cancel,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections * 2,
            ),

            // Full Name TextFormField with dynamic floating label color
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isFullNameFocused = hasFocus;
                });
              },
              child: TextFormField(
                controller: fullNameController, // Attach controller
                decoration: InputDecoration(
                  labelText: AppText.signUp_fullname,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                  hintStyle: const TextStyle(color: Colors.white70),
                  floatingLabelStyle: TextStyle(
                    color:
                        isFullNameFocused ? AppColors.mainColor : Colors.white,
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
              height: AppSizes.spaceBtwInputFields * 2,
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
                  labelText: AppText.signUp_email,
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
              height: AppSizes.spaceBtwInputFields * 2,
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
                  labelText: AppText.signUp_pass,
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
              height: AppSizes.spaceBtwInputFields * 2,
            ),
            // Confirm Password TextFormField with dynamic floating label color
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isConfirmPasswordFocused = hasFocus;
                });
              },
              child: TextFormField(
                controller: confirmPasswordController, // Attach controller
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppText.signUp_confirm,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                  hintStyle: const TextStyle(color: Colors.white70),
                  floatingLabelStyle: TextStyle(
                    color: isConfirmPasswordFocused
                        ? AppColors.mainColor
                        : Colors.white,
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
                    AppText.signUp_signIn,
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
          ],
        ),
      ),
    );
  }
}
