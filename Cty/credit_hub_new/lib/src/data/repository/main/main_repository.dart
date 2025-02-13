import 'package:credit_hub_new/src/shared/app_export.dart';

abstract class MainRepository {
  Future<BaseResponse> getDashboard();

  Future<BaseResponse> postHistory({required HistoryModel param});

  Future<BaseResponse> postAdd({required AddModel param});
  Future<BaseResponse> postAddImage({required AddImageModel param});
}
