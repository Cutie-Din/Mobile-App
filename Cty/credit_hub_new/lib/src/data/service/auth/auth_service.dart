import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/model/model_barrel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

  @POST('/app/auth/login')
  Future<HttpResponse<BaseResponse<UserModel>>> signIn(@Body() SignInParam body);

  // @GET('/api/user/{id}')
  // Future<HttpResponse<BaseResponse<AccountModel>>> getUser(@Path() String id);

  // @PUT('/api/user/{id}')
  // Future<HttpResponse<BaseResponse<AccountModel>>> updateAvatar(
  //     @Path() String id, @Body() UploadImageModel param);

  // @PUT('/api/change-password')
  // Future<HttpResponse<BaseResponse>> changePassword(@Body() ChangePasswordModel param);

  @GET('/api/logout')
  Future<HttpResponse> logout();
}
