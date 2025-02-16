import 'package:credit_hub_new/src/shared/app_export.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @Default(0) final int page_no,
    @Default(0) final int page_size,
    @Default([]) List<RequestNotification> data,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
