import 'package:credit_hub_new/src/utils/app_export.dart';
part 'change_password_model.freezed.dart';
part 'change_password_model.g.dart';

@freezed
class ChangePasswordModel with _$ChangePasswordModel {
  const factory ChangePasswordModel({
    @Default('') final String old_password,
    @Default('') final String new_password,
    @Default('') final String otp_code,
  }) = _ChangePasswordModel;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);
}
