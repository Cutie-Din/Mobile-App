import 'package:credit_hub_new/src/shared/app_export.dart';
part 'forgot_password_param.freezed.dart';
part 'forgot_password_param.g.dart';

@freezed
class ForgotPasswordParam with _$ForgotPasswordParam {
  const factory ForgotPasswordParam({
    @Default('') final String email,
  }) = _ForgotPasswordParam;

  factory ForgotPasswordParam.fromJson(Map<String, Object?> json) =>
      _$ForgotPasswordParamFromJson(json);
}
