import 'package:flutter/material.dart';

class AppDeviceUtils {
  // Lấy kích thước của màn hình
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // Lấy chiều rộng của màn hình
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Lấy chiều cao của màn hình
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Lấy tỷ lệ mật độ điểm ảnh (pixel density)
  static double pixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // Lấy kích thước của thanh trạng thái
  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // Lấy kích thước của thanh điều hướng (nếu có)
  static double navigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double keyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom; // Lấy chiều cao của bàn phím
  }
}
