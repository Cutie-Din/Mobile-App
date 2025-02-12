import 'package:credit_hub_new/src/shared/app_export.dart';
import 'main_service.dart';

class MainServiceApi extends BaseRemoteSource implements MainRepository {
  final MainService service;

  MainServiceApi({required this.service});

  @override
  Future<BaseResponse<DashboardModel>> getDashboard({required DashboardModel param}) {
    final response = callApiWithErrorParser(service.getDashboard(param)).then((httpResponse) {
      return httpResponse as BaseResponse<DashboardModel>;
    });

    return response;
  }
}
