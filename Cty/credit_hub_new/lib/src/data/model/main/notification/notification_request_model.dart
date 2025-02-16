import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_request_model.freezed.dart';
part 'notification_request_model.g.dart';

@freezed
class RequestNotification with _$RequestNotification {
  const factory RequestNotification({
    final int? id,
    @Default('') String image_link,
    @Default('') String date_request,
    @Default('') String date_finish,
    @Default('') String lot_no,
    @Default(0.0) double money_request,
    @Default('') String status_name,
  }) = _RequestNotification;

  factory RequestNotification.fromJson(Map<String, dynamic> json) =>
      _$RequestNotificationFromJson(json);
}
