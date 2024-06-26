import 'package:flutter/material.dart';
import 'package:minimal_note/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  // Khởi tạo nền sáng khi vào app
  ThemeData _themeData = lightMode;

  // Phương thức getter để truy cập vào màu nền từ phần khác của code
  ThemeData get themeData => _themeData;

  // Phương thức getter để xem có đang ở chế đọ tối hay không
  bool get isDarkMode => _themeData == darkMode;

  // Phương thức setter để set chế độ màu mới
  set themeData(ThemeData themData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Sử dụng chuyển đổi qua lại
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
