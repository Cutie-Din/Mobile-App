import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppChipThem {
  AppChipThem._();

  // Light Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: Colors.white,
  );

  // Dark Theme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: Colors.white,
  );
}
