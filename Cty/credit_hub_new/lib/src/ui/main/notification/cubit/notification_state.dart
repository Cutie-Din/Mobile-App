import 'package:credit_hub_new/src/shared/app_export.dart';

part 'notification_state.freezed.dart';

enum NotificationStatus { initial, loading, success, failure }

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(NotificationStatus.initial) NotificationStatus status,
    @Default([]) List<RequestNotification> data,
    RequestNotification? data_received,
    @Default('') String message,
  }) = _NotificationState;
}
