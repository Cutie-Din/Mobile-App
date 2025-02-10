import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/model/auth/change_password_model.dart';
import 'package:credit_hub_new/src/data/model/auth/forgot_password_param.dart';
import 'package:credit_hub_new/src/data/model/auth/otp_model.dart';
import 'package:credit_hub_new/src/data/model/model_barrel.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRepository repo;

  const AuthRepositoryImpl({required this.repo});

  @override
  Future<BaseResponse<UserModel>> signIn({required SignInParam param}) => repo.signIn(
        param: param,
      );

  @override
  Future<BaseResponse> sendEmail({required ForgotPasswordParam param}) =>
      repo.sendEmail(param: param);

  @override
  Future<BaseResponse> confirmOtp({required OtpModel otp}) => repo.confirmOtp(
        otp: otp,
      );

  @override
  Future<BaseResponse> changePassword({required ChangePasswordModel param}) =>
      repo.changePassword(param: param);

  // @override
  // Future<BaseResponse<AccountModel>> getUser({required int? id}) => repo.getUser(id: id);

  @override
  Future logout() => repo.logout();

  // @override
  // Future<BaseResponse<AccountModel>> updateAvatar(
  //         {required UploadImageModel param, required int? id}) =>
  //     repo.updateAvatar(param: param, id: id);
}
