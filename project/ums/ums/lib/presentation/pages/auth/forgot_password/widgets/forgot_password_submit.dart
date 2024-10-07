import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class ForgotPasswordFormSubmit extends StatefulWidget {
  const ForgotPasswordFormSubmit({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormSubmitState createState() => _ForgotPasswordFormSubmitState();
}

class _ForgotPasswordFormSubmitState extends State<ForgotPasswordFormSubmit> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitNewPassword() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword == confirmPassword) {
      // Xử lý logic khi mật khẩu mới và xác nhận mật khẩu khớp nhau
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cập nhật mật khẩu thành công")),
      );
      Navigator.pushReplacementNamed(context, '/sign-in');
    } else {
      // Hiển thị thông báo lỗi nếu hai mật khẩu không khớp
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mật khẩu không trùng khớp")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.sm * 0.5),
          // Trường nhập mật khẩu mới
          TextField(
            controller: _newPasswordController,
            obscureText: true, // Ẩn mật khẩu
            decoration: InputDecoration(
              labelText: AppText.forgot_new_pass_1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
          // Trường nhập lại mật khẩu mới
          TextField(
            controller: _confirmPasswordController,
            obscureText: true, // Ẩn mật khẩu
            decoration: InputDecoration(
              labelText: AppText.forgot_new_pass_2,
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
            onPressed: _submitNewPassword, // Khi bấm gửi mật khẩu mới
            child: const Text(
              AppText.forgot_btn_3,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: AppFonts.fontSizeMd,
                color: AppColors.bg,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 1.5),
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
