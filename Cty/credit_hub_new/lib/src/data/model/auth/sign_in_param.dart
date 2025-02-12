import 'package:credit_hub_new/src/shared/app_export.dart';
part 'sign_in_param.freezed.dart';
part 'sign_in_param.g.dart';

@freezed
class SignInParam with _$SignInParam {
  const factory SignInParam({
    @Default('') final String username,
    @Default('') final String password,
    @Default('') final String device_id,
  }) = _SignInParam;

  factory SignInParam.fromJson(Map<String, Object?> json) => _$SignInParamFromJson(json);
}
