import 'package:credit_hub_new/src/shared/app_export.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @Default('') final String message,
    @Default('') final String error,
    @Default(1) final int status,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, Object?> json) => _$ErrorResponseFromJson(json);
}
