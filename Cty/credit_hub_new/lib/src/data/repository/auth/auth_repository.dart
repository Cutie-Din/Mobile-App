import 'package:credit_hub_new/src/data/_base/base_barrel.dart';
import 'package:credit_hub_new/src/data/model/model_barrel.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserModel>> signIn({required SignInParam param});

  // Future<BaseResponse<AccountModel>> getUser({required int? id});

  // Future<BaseResponse<AccountModel>> updateAvatar(
  //     {required UploadImageModel param, required int? id});

  // Future<BaseResponse> changePassword({required ChangePasswordModel param});

  Future logout();
}
