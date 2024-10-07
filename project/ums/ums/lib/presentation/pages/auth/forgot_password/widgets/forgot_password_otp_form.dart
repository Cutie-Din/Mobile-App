import 'package:flutter/material.dart';
import 'package:ums/core/constants/validators.dart';
import 'package:ums/core/constants/colors.dart';
import 'package:ums/core/constants/fonts.dart';
import 'package:ums/core/constants/sizes.dart';
import 'package:ums/core/constants/text_strings.dart';

class ForgotPasswordFormOTP extends StatefulWidget {
  const ForgotPasswordFormOTP({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormOTPState createState() => _ForgotPasswordFormOTPState();
}

class _ForgotPasswordFormOTPState extends State<ForgotPasswordFormOTP> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  bool _hasError = false;

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitOTP() {
    if (AppValidator.validateOTP(_otpControllers)) {
      // Logic xử lý khi OTP hợp lệ
      Navigator.pushReplacementNamed(context, '/forgot-submit');
    } else {
      setState(() {
        _hasError = true; // Đánh dấu rằng có lỗi để thay đổi giao diện
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập mã xác thực")),
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
            borderSide: BorderSide(
              color: _hasError ? Colors.red : AppColors.main, // Đổi màu viền khi có lỗi
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _hasError = false; // Reset lỗi khi người dùng nhập lại
          });

          if (value.length == 1 && index < 5) {
            FocusScope.of(context)
                .nextFocus(); // Tự động chuyển sang ô tiếp theo khi nhập xong 1 chữ số
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus(); // Quay lại ô trước nếu ô hiện tại trống
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
          const Text(
            AppText.forgot_mxt,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: AppFonts.fontSizeSm * 2,
              fontWeight: AppFonts.bold,
              color: AppColors.main,
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
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
            onPressed: _submitOTP,
            child: const Text(
              AppText.forgot_btn_2,
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
