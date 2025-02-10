import 'package:credit_hub_new/src/utils/app_export.dart';

part 'forgot_password_state.freezed.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ForgotPasswordStatus.initial) final ForgotPasswordStatus status,
    @Default('') final String message,
  }) = _ForgotPasswordState;
}
