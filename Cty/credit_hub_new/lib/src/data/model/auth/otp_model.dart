import 'package:credit_hub_new/src/utils/app_export.dart';
part 'otp_model.freezed.dart';
part 'otp_model.g.dart';

@freezed
class OtpModel with _$OtpModel {
  const factory OtpModel({
    @Default('') final String otp_code,
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);
}
