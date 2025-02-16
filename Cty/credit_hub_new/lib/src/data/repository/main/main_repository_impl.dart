import 'package:credit_hub_new/src/shared/app_export.dart';

import 'main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRepository repo;

  const MainRepositoryImpl({required this.repo});

  @override
  Future<BaseResponse> getDashboard() => repo.getDashboard();

  @override
  Future<BaseResponse> postHistory({required HistoryModel param}) => repo.postHistory(param: param);

  @override
  Future<BaseResponse> getHistoryDetail({required int id}) => repo.getHistoryDetail(id: id);

  @override
  Future<BaseResponse> resendHistory({required RequestHistory param}) =>
      repo.resendHistory(param: param);

  @override
  Future<BaseResponse> postAdd({required AddModel param}) => repo.postAdd(param: param);

  @override
  Future<BaseResponse> postNotification({required NotificationModel param}) =>
      repo.postNotification(param: param);

  @override
  Future<BaseResponse> getNotificationDetail({required int id}) =>
      repo.getNotificationDetail(id: id);

  @override
  Future<BaseResponse> getDropdownBank() => repo.getDropdownBank();
}
