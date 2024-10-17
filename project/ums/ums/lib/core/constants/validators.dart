import 'package:flutter/material.dart';

class AppValidator {
  static String? validateStudentId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mã sinh viên';
    }
    if (value.length < 8) {
      return 'Mã sinh viên bao gồm tối thiểu 8 số';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }

    // Kiểm tra độ dài tối thiểu
    if (value.length < 8) {
      return 'Mật khẩu bao gồm tối thiểu 8 ký tự';
    }

    // Kiểm tra từng điều kiện
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'\d'));
    bool hasSpecialChar = value.contains(RegExp(r'[\W_]'));

    // Xác định điều kiện nào bị thiếu và trả về thông báo lỗi cụ thể
    if (!hasUppercase) {
      return 'Thiếu chữ cái hoa';
    }
    if (!hasLowercase) {
      return 'Thiếu chữ cái thường';
    }
    if (!hasDigit) {
      return 'Mật khẩu phải bao gồm ít nhất một số';
    }
    if (!hasSpecialChar) {
      return 'Thiếu ký tự đặc biệt';
    }

    // Nếu tất cả điều kiện đều đạt
    return null;
  }

  static bool validateOTP(List<TextEditingController> otpControllers) {
    String otp = otpControllers.map((controller) => controller.text).join();
    return otp.length == 6 && RegExp(r'^\d{6}$').hasMatch(otp);
  }
}
