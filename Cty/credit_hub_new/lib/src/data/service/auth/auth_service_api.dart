import 'package:credit_hub_new/src/utils/app_export.dart';
import 'auth_service.dart';

class AuthServiceApi extends BaseRemoteSource implements AuthRepository {
  final AuthService service;

  AuthServiceApi({required this.service});

  @override
  Future<BaseResponse<UserModel>> signIn({required SignInParam param}) {
    final response = callApiWithErrorParser(service.signIn(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> sendEmail({required ForgotPasswordParam param}) {
    final response = callApiWithErrorParser(service.sendEmail(param)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> confirmOtp({required OtpModel otp}) {
    final response = callApiWithErrorParser(service.confirmOtp(otp)).then((httpResponse) {
      return httpResponse.data;
    });
    return response;
  }

  @override
  Future<BaseResponse> changePassword({required ChangePasswordModel param}) {
    final response = callApiWithErrorParser(service.changePassword(param)).then(
      (httpResponse) {
        return httpResponse.data;
      },
    );
    return response;
  }

  // @override
  // Future<BaseResponse<AccountModel>> getUser({required int? id}) {
  //   final response = callApiWithErrorParser(service.getUser(id.toString())).then(
  //     (httpResponse) {
  //       return httpResponse.data;
  //     },
  //   );
  //   return response;
  // }

  @override
  Future logout() {
    final response = callApiWithErrorParser(service.logout()).then(
      (httpResponse) {
        return httpResponse.data;
      },
    );
    return response;
  }

  // @override
  // Future<BaseResponse<AccountModel>> updateAvatar(
  //     {required UploadImageModel param, required int? id}) {
  //   final response = callApiWithErrorParser(service.updateAvatar(id.toString(), param)).then(
  //     (httpResponse) {
  //       return httpResponse.data;
  //     },
  //   );
  //   return response;
  // }
}
