import 'package:credit_hub_new/src/shared/app_export.dart';

class AppThemeData with Diagnosticable {
  AppThemeData();

  late TextStyle text_21_700;
  late TextStyle text_20_600;
  late TextStyle text_20_500;
  late TextStyle text_16_700;
  late TextStyle text_16_500;
  late TextStyle text_16_400;
  late TextStyle text_18_700;
  late TextStyle text_14_500;
  late TextStyle text_14_600;
  late TextStyle text_14_400;
  late TextStyle text_14_700;
  late TextStyle text_12_700;
  late TextStyle text_12_600;
  late TextStyle text_12_400;
  late TextStyle text_10_400;
  late TextStyle body1;
  late TextStyle body2;
  late TextStyle caption1;
  late TextStyle text_13_300;

  late TextStyle textLink;
  late TextStyle textFieldLabelHoriz;
  late TextStyle textFieldLabelHorizDisabled;
  late TextStyle textFieldLabelHorizFocused;
  late TextStyle textFieldLabel;
  late TextStyle textFieldLabelDisabled;
  late TextStyle textFieldLabelFocused;
  late TextStyle textFieldText;
  late TextStyle textFieldTextDisabled;
  late TextStyle textFieldHint;
  late TextStyle textFieldHintDisabled;
  late TextStyle textFieldError;
  late TextStyle textFieldErrorDisabled;

  late double defaultPadding;

  factory AppThemeData.fromContext(BuildContext context) {
    final AppThemeData theme = AppThemeData();

    theme.text_20_600 = const TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      color: AppColors.black5,
    );

    theme.text_18_700 = theme.text_20_600.copyWith(fontWeight: FontWeight.w700, fontSize: 18);
    theme.text_21_700 = theme.text_20_600.copyWith(fontWeight: FontWeight.w700, fontSize: 21);
    theme.text_20_500 = theme.text_20_600.copyWith(fontWeight: FontWeight.w500);
    theme.text_16_500 = theme.text_20_600.copyWith(fontSize: 16.0);
    theme.text_16_400 = theme.text_16_500.copyWith(fontWeight: FontWeight.w400);
    theme.text_16_700 = theme.text_16_500.copyWith(fontWeight: FontWeight.w700);
    theme.text_10_400 = theme.text_16_400.copyWith(fontSize: 10.0);
    theme.text_14_400 = theme.text_16_400.copyWith(fontSize: 14.0);
    theme.text_14_600 = theme.text_14_400.copyWith(fontWeight: FontWeight.w600);
    theme.text_14_500 = theme.text_14_400.copyWith(fontWeight: FontWeight.w500);
    theme.text_14_700 = theme.text_14_400.copyWith(fontWeight: FontWeight.w700);
    theme.text_12_700 = theme.text_16_400.copyWith(fontSize: 12.0, fontWeight: FontWeight.w700);
    theme.text_12_600 = theme.text_12_700.copyWith(fontWeight: FontWeight.w600);
    theme.text_12_400 = theme.text_12_700.copyWith(fontWeight: FontWeight.w400);
    theme.body1 = theme.text_20_600.copyWith(fontSize: 14.0);
    theme.body2 = theme.body1.copyWith(fontWeight: FontWeight.w400);
    theme.caption1 = theme.text_20_600.copyWith(fontSize: 13.0);
    theme.text_13_300 = theme.caption1.copyWith(fontWeight: FontWeight.w300);

    theme.textFieldLabel = theme.text_14_500.copyWith(color: AppColors.grey4);
    theme.textFieldLabelDisabled = theme.textFieldLabel.copyWith(color: AppColors.grey3);
    theme.textFieldLabelFocused = theme.textFieldLabel.copyWith(color: AppColors.primary);
    theme.textFieldText = theme.text_16_500.copyWith(color: AppColors.black5);
    theme.textFieldTextDisabled = theme.textFieldText.copyWith(color: AppColors.grey3);
    theme.textFieldHint = theme.text_14_400.copyWith(color: AppColors.grey4);
    theme.textFieldHintDisabled = theme.textFieldHint.copyWith(color: AppColors.grey3);
    theme.textFieldError = theme.text_14_500.copyWith(color: AppColors.primary);
    theme.textFieldErrorDisabled = theme.textFieldError.copyWith(color: AppColors.grey3);

    theme.defaultPadding = 20.0;

    return theme;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is AppThemeData &&
        other.text_20_600 == text_20_600 &&
        other.text_16_500 == text_16_500 &&
        other.text_16_400 == text_16_400 &&
        other.body1 == body1 &&
        other.body2 == body2 &&
        other.caption1 == caption1 &&
        other.text_13_300 == text_13_300 &&
        other.textLink == textLink;
  }

  @override
  int get hashCode => Object.hashAll([
        text_20_600,
        text_16_500,
        text_16_400,
        body1,
        body2,
        caption1,
        text_13_300,
        textLink,
      ]);
}
