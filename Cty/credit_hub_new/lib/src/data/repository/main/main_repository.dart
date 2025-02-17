import 'package:credit_hub_new/src/shared/app_export.dart';

abstract class MainRepository {
  Future<BaseResponse> getDashboard();

  Future<BaseResponse> postHistory({required HistoryModel param});
  Future<BaseResponse> getHistoryDetail({required int id});
  Future<BaseResponse> resendHistory({required RequestHistory param});

  Future<BaseResponse> postAdd({required AddModel param});

  Future<BaseResponse> postNotification({required NotificationModel param});
  Future<BaseResponse> getNotificationDetail({required int id});

  Future<BaseResponse> getDropdownBank();
  Future<BaseResponse> postAccount({required AccountModel param});
  Future<BaseResponse> createAccount({required AccountDetail param});
  Future<BaseResponse> updateAccount({required AccountDetail param});
  Future<BaseResponse> deleteAccount({required AccountDetail param});
  Future<BaseResponse> getAccount({required int id});
}
