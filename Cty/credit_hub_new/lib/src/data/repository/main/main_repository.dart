import 'package:credit_hub_new/src/shared/app_export.dart';

abstract class MainRepository {
  Future<BaseResponse> getDashboard({required DashboardModel param});
}
