import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

@freezed
class Request with _$Request {
  const factory Request({
    @Default('') String id,
    @Default('') String date_request,
    @Default('') String lot_no,
    @Default(0.0) double money_request,
    @Default('') String status,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);
}
