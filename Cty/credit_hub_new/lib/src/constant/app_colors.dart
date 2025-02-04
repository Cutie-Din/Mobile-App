import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  //Base Colors
  static const Color primary = Color(0xFFFF4A4A);
  static const Color secondary = Color(0xFFFFBB24);
  static const Color tertiary = Color(0xFF717E95);
  static const Color dot = Color(0xFFC62127);
  static const Color star = Color(0xFFFF0000);
  static const Color pick_1 = Color(0xFF00A127);
  static const Color pick_2 = Color(0xFF00BDFF);

  //Transaction Colors
  static const LinearGradient waiting = LinearGradient(
    colors: [Color(0xFFFFD001), Color(0xFFFFC727)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const LinearGradient confirmed = LinearGradient(
    colors: [Color(0xFF4BF56C), Color(0xFF1AC53B)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const LinearGradient cancelled = LinearGradient(
    colors: [Color(0xFFFF754A), Color(0xFFFF4A4A)],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  // Text Colors
  static const Color button = Color(0xFFFFFFFF);
  static const Color black1 = Color(0xFF525252);
  static const Color black2 = Color(0xFF1F2937);
  static const Color black3 = Color(0xFF1A1A1A);
  static const Color black4 = Color(0xFF090A0A);
  static const Color black5 = Color(0xFF000000);
  static const Color black6 = Color(0xFF272727);
  static const Color grey1 = Color(0xFF6B7280);
  static const Color grey2 = Color(0xFF4B5563);
  static const Color grey3 = Color(0xFF717E95);
  static const Color grey4 = Color(0xFF7C7C7C);
  static const Color grey5 = Color(0xFF646464);
  static const Color grey6 = Color(0xFF737373);
  static const Color grey7 = Color(0xFF7E7E7E);
  static const Color grey8 = Color(0xFFF5F5F5);
  static const Color grey9 = Color(0xFFA9AAAE);
}
