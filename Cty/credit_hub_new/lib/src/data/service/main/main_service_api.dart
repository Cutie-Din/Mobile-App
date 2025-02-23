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
  Future<BaseResponse> getHistoryDetail({required int id}) {
    final response = callApiWithErrorParser(service.getHistoryDetail(id)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> resendHistory({required RequestHistory param}) {
    final response = callApiWithErrorParser(service.resendHistory(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> postNotification({required NotificationModel param}) {
    final response = callApiWithErrorParser(service.postNotification(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> getNotificationDetail({required int id}) {
    final response = callApiWithErrorParser(service.getNotificationDetail(id)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> getDropdownBank() {
    final response = callApiWithErrorParser(service.getDropdownBank()).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> postAccount({required AccountModel param}) {
    final response = callApiWithErrorParser(service.postAccount(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> createAccount({required AccountDetail param}) {
    final response = callApiWithErrorParser(service.createAccount(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> updateAccount({required AccountDetail param}) {
    final response = callApiWithErrorParser(service.updateAccount(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> deleteAccount({required AccountDetail param}) {
    final response = callApiWithErrorParser(service.deleteAccount(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> getAccount({required int id}) {
    final response = callApiWithErrorParser(service.getAccount(id)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> searchAccount({required AccountModel param}) {
    final response = callApiWithErrorParser(service.searchAccount(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }
}
