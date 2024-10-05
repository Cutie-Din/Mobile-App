import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class ForgotPasswordFormOTP extends StatefulWidget {
  const ForgotPasswordFormOTP({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormOTPState createState() => _ForgotPasswordFormOTPState();
}

class _ForgotPasswordFormOTPState extends State<ForgotPasswordFormOTP> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitOTP() {
    String otp = _otpControllers
        .map((controller) => controller.text)
        .join(); // Kết hợp tất cả các giá trị OTP lại

    if (otp.length == 6) {
      // Xử lý logic khi OTP hợp lệ (đúng 6 chữ số)
    } else {
      // Hiển thị cảnh báo hoặc thông báo lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit OTP")),
      );
    }
  }

  Widget _buildOTPField(int index) {
    return SizedBox(
      width: 40, // Chiều rộng mỗi ô OTP
      child: TextField(
        controller: _otpControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center, // Canh giữa nội dung nhập
        maxLength: 1, // Giới hạn mỗi ô chỉ nhập 1 chữ số
        decoration: InputDecoration(
          counterText: '', // Ẩn bộ đếm ký tự
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context)
                .nextFocus(); // Tự động chuyển sang ô tiếp theo khi nhập xong 1 chữ số
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.sm * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Cách đều các ô
            children: List.generate(6, (index) => _buildOTPField(index)), // Tạo 6 ô OTP
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
              Navigator.pushReplacementNamed(context, '/forgot-submit');
            },
            child: const Text(
              AppText.forgot_btn_2,
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
