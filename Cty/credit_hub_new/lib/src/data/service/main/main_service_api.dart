import 'package:credit_hub_new/src/shared/app_export.dart';
import 'main_service.dart';

class MainServiceApi extends BaseRemoteSource implements MainRepository {
  final MainService service;

  MainServiceApi({required this.service});

  @override
  Future<BaseResponse> getDashboard() {
    final response = callApiWithErrorParser(service.getDashboard()).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> postHistory({required HistoryModel param}) {
    final response = callApiWithErrorParser(service.postHistory(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> postAdd({required AddModel param}) {
    final response = callApiWithErrorParser(service.postAdd(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> postAddImage({required AddImageModel param}) {
    final response = callApiWithErrorParser(service.postAddImage(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }
}
