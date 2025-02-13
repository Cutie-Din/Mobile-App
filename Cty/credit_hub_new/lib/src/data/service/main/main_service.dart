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

  @POST('/app/requestmoneyorder/create')
  Future<HttpResponse<BaseResponse>> postAdd(@Body() AddModel body);

  @POST('/upload/uploadfile')
  Future<HttpResponse<BaseResponse>> postAddImage(@Body() AddImageModel body);
}
