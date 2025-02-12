import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'main_service.g.dart';

@RestApi()
abstract class MainService {
  factory MainService(Dio dio, {String? baseUrl}) = _MainService;
  @GET('/app/home/homeInfo')
  Future<HttpResponse<BaseResponse>> getDashboard(@Body() DashboardModel body);
}
