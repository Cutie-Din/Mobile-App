import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_request_model.freezed.dart';
part 'history_request_model.g.dart';

@freezed
class RequestHistory with _$RequestHistory {
  const factory RequestHistory({
    final int? id,
    @Default('') String image_link,
    @Default('') String date_request,
    @Default('') String date_finish,
    @Default('') String lot_no,
    @Default(0.0) double money_request,
    @Default('') String status_name,
  }) = _RequestHistory;

  factory RequestHistory.fromJson(Map<String, dynamic> json) => _$RequestHistoryFromJson(json);
}
