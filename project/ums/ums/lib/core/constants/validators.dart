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
    if (value.length < 8) {
      return 'Mật khẩu bao gồm tối thiểu 8 ký tự';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$').hasMatch(value)) {
      return 'Mật khẩu gồm chữ cái hoa, chữ cái thường, số và ký tự đặc biệt';
    }
    return null;
  }

  static bool validateOTP(List<TextEditingController> otpControllers) {
    String otp = otpControllers.map((controller) => controller.text).join();
    return otp.length == 6 && RegExp(r'^\d{6}$').hasMatch(otp);
  }
}
