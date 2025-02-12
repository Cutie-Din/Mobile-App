import 'package:credit_hub_new/src/shared/app_export.dart';

part 'change_password_state.freezed.dart';

enum ChangePasswordStatus { initial, loading, success, failure }

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(ChangePasswordStatus.initial) final ChangePasswordStatus status,
    @Default('') final String message,
  }) = _ChangePasswordState;
}
