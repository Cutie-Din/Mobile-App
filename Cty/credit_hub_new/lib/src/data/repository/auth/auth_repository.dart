import 'package:credit_hub_new/src/shared/app_export.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserModel>> signIn({required SignInParam param});

  // Future<BaseResponse<AccountModel>> getUser({required int? id});

  // Future<BaseResponse<AccountModel>> updateAvatar(
  //     {required UploadImageModel param, required int? id});

  // Future<BaseResponse> changePassword({required ChangePasswordModel param});

  Future<BaseResponse> sendEmail({required ForgotPasswordParam param});

  Future<BaseResponse> confirmOtp({required OtpModel otp});

  Future<BaseResponse> changePassword({required ChangePasswordModel param});

  Future logout();
}
