import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // App Color
  static const Color mainColor = Color(0xFF3D58F8);

  // Gradient Color
  static const Gradient non_active = LinearGradient(
    colors: [Color(0xFF48CAE7)],
  );

  static const Gradient main_gradient = LinearGradient(
    colors: [
      Color(0xFF3E60F9),
      Color(0xFF3D54F8),
    ],
  );

  static const Gradient second_gradient = LinearGradient(
    colors: [
      Color(0xFF449EFF),
      Color(0xFF1DC7F7),
    ],
  );

  // Illustration Color
  static const Color color_ill_1 = Color(0xFF2C4BA1);
  static const Color color_ill_2 = Color(0xFF1E3577);

  // Background Color
  static const Color whiteBgr = Color(0xFFFFFFFF);
  static const Color greyBgr_1 = Color(0xFFABADBD);
  static const Color greyBgr_2 = Color(0xFF42476A);
  static const Color greyBgr_3 = Color(0xB3FFFFFF);
  static const Color darkBgr_1 = Color(0xFF0B0F2F);
  static const Color darkBgr_2 = Color(0xFF151D3B);
  static const Color veryDarkBrg = Color(0xFF051138);

  // Error and Validation Colors
  static const Color error = Color(0xFFFF5353);
}
