import 'package:finance/import.dart';

class FormValidator {
  static String? validateLotNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập đầy đủ';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập đầy đủ';
    }
    return null;
  }
}
