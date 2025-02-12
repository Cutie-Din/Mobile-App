import 'package:credit_hub_new/src/shared/app_export.dart';

part 'sign_in_state.freezed.dart';

enum SignInStatus { initial, loading, success, failure }

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.initial) final SignInStatus status,
    @Default(UserModel()) final UserModel data,
    @Default('') final String message,
  }) = _SignInState;
}
