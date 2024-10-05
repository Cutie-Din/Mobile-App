import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _studentIdController = TextEditingController();

  @override
  void dispose() {
    _studentIdController.dispose();
    super.dispose();
  }

  void _submitForgotPassword() {
    String studentId = _studentIdController.text;
    // Logic xử lý khi người dùng bấm gửi yêu cầu quên mật khẩu
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.sm * 0.5),
          TextField(
            controller: _studentIdController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppText.sign_In_msv,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/forgot-otp');
            },
            child: const Text(
              AppText.forgot_btn_1,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: AppFonts.fontSizeMd,
                color: AppColors.bg,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
            child: const Text(
              AppText.cancel,
              style: TextStyle(fontFamily: "Montserrat", color: AppColors.main),
            ),
          ),
        ],
      ),
    );
  }
}
