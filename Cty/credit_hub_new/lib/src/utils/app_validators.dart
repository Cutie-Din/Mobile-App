import 'dart:io';

class AppValidator {
  static String? validateLotNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số lô';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập đầy đủ';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  static String? validatePasswordMatch(String? value1, String? value2) {
    if (value1 != value2) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tài khoản email';
    }
    return null;
  }

  static String? validateId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số lô';
    }
    return null;
  }

  static String? validateMoney(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số tiền';
    }
    return null;
  }

  static String? validateBankNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số tài khoản';
    }
    return null; // Return null if valid
  }

  static String? validateBankOwner(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập tên chủ tài khoản';
    }
    return null; // Return null if valid
  }

  static String? validateBankName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng chọn ngân hàng liên kết';
    }
    return null; // Return null if valid
  }

  static String? validateImageUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Hãy chọn hình ảnh hóa đơn.';
    }
    return null;
  }
}
