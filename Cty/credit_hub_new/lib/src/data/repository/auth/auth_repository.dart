import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/model/auth/change_password_model.dart';
import 'package:credit_hub_new/src/data/model/auth/forgot_password_param.dart';
import 'package:credit_hub_new/src/data/model/auth/otp_model.dart';
import 'package:credit_hub_new/src/data/model/model_barrel.dart';

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
