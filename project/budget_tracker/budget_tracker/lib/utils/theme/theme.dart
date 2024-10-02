import 'package:budget_tracker/utils/theme/custom_themes/appbar_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/chip_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/text_theme.dart';
import 'package:budget_tracker/utils/theme/custom_themes/textfield_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  AppTheme._();
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "RobotoMono",
    brightness: Brightness.light,
    // primaryColor: AppColors.primary,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipThem.lightChipTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "RobotoMono",
    brightness: Brightness.dark,
    // primaryColor: AppColors.primary,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipThem.darkChipTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
  );
}
