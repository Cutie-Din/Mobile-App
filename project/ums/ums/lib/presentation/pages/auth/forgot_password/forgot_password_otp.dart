import 'package:flutter/material.dart';
import 'package:ums/presentation/pages/auth/forgot_password/widgets/forgot_password_otp_form.dart';
import 'package:ums/presentation/pages/auth/forgot_password/widgets/forgot_password_form.dart';

import 'widgets/forgot_password_logo_container.dart';

class ForgotPasswordOTPScreen extends StatelessWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Column(
        children: [
          // Phần logo với border cong ở dưới
          LogoContainer(),

          // Phần form đăng nhập ở dưới
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ForgotPasswordFormOTP(),
            ),
          ),
        ],
      ),
    );
  }
}
