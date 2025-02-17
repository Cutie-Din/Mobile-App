import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'main_service.g.dart';

@RestApi()
abstract class MainService {
  factory MainService(Dio dio, {String? baseUrl}) = _MainService;
  @GET('/app/home/homeInfo')
  Future<HttpResponse<BaseResponse>> getDashboard();

  @POST('/app/requestmoneyorder/list')
  Future<HttpResponse<BaseResponse>> postHistory(@Body() HistoryModel body);

  @POST('/app/requestmoneyorder/reRequest')
  Future<HttpResponse<BaseResponse>> resendHistory(@Body() RequestHistory body);

  @GET('/app/requestmoneyorder/detail/{id}')
  Future<HttpResponse<BaseResponse>> getHistoryDetail(@Path('id') int id);

  @POST('/app/requestmoneyorder/create')
  Future<HttpResponse<BaseResponse>> postAdd(@Body() AddModel body);

  @POST('/app/notification/getList')
  Future<HttpResponse<BaseResponse>> postNotification(@Body() NotificationModel body);

  @GET('/app/notification/detail/{id}')
  Future<HttpResponse<BaseResponse>> getNotificationDetail(@Path('id') int id);

  @GET('/dropdown/bank')
  Future<HttpResponse<BaseResponse>> getDropdownBank();

  @POST('/app/bankaccount/list')
  Future<HttpResponse<BaseResponse>> postAccount(@Body() AccountModel body);

  @POST('/app/bankaccount/create')
  Future<HttpResponse<BaseResponse>> createAccount(@Body() AccountDetail body);

  @POST('/app/bankaccount/update')
  Future<HttpResponse<BaseResponse>> updateAccount(@Body() AccountDetail body);

  @POST('/app/bankaccount/delete')
  Future<HttpResponse<BaseResponse>> deleteAccount(@Body() AccountDetail body);

  @GET('app/bankaccount/{id}')
  Future<HttpResponse<BaseResponse>> getAccount(@Path('id') int id);
}
