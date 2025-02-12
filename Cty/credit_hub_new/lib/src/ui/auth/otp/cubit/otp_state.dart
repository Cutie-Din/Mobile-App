import 'package:credit_hub_new/src/shared/app_export.dart';

part 'otp_state.freezed.dart';

enum OtpStatus { initial, loading, success, failure }

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    @Default(OtpStatus.initial) final OtpStatus status,
    @Default('') final String message,
  }) = _OtpState;
}
