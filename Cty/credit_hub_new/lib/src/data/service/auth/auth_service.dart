import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/model/auth/forgot_password_param.dart';
import 'package:credit_hub_new/src/data/model/auth/otp_model.dart';
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

  @POST('/app/auth/sendCodeForgetBrand')
  Future<HttpResponse<BaseResponse>> sendEmail(@Body() ForgotPasswordParam body);

  @POST('/app/auth/confirmCodeForgetBrand')
  Future<HttpResponse<BaseResponse>> confirmOtp(@Body() OtpModel body);

  @GET('/api/logout')
  Future<HttpResponse> logout();
}
