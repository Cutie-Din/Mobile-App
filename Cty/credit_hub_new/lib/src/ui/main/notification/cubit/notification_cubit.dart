import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'notification_state.dart';

final logger = getLogger("NotificationCubit");

class NotificationCubit extends Cubit<NotificationState> {
  final MainRepository repo;
  final AppManager appManager;

  NotificationCubit(this.repo, this.appManager) : super(const NotificationState());

  Future<void> postNotification({required int page_no, required int page_size}) async {
    try {
      emit(state.copyWith(status: NotificationStatus.loading));
      NotificationModel postNotification =
          NotificationModel(page_no: page_no, page_size: page_size);
      final response = await repo.postNotification(param: postNotification);
      final notificationModel = NotificationModel.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: NotificationStatus.success, data: notificationModel.data));
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.failure, message: e.toString()));
    }
  }

  Future<void> getNotificationDetail({required int id}) async {
    try {
      emit(state.copyWith(status: NotificationStatus.loading));

      final response = await repo.getNotificationDetail(id: id);
      final notificationDetail =
          RequestNotification.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: NotificationStatus.success, data_received: notificationDetail));
    } catch (e) {
      emit(state.copyWith(status: NotificationStatus.failure, message: e.toString()));
    }
  }
}
