import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'sign_in_state.dart';

final logger = getLogger("SignInCubit");

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository repo;
  final AppManager appManager;

  SignInCubit(this.repo, this.appManager) : super(const SignInState());

  Future<void> signIn({required String username, required String password}) async {
    try {
      emit(state.copyWith(status: SignInStatus.loading));
      logger.d('Current state: ${state.toString()}');

      SignInParam signInParam = SignInParam(
          username: username, password: password, device_id: await AppConfig.getDeviceId());

      final response = await repo.signIn(param: signInParam);
      if (response.data == null) {
        emit(state.copyWith(
          status: SignInStatus.failure,
          message: response.error ?? "Unknown",
        ));
        logger.d('Response from repo: ${response.toString()}');

        return;
      }
      logger.d('Response: ${jsonEncode(response.toJson((data) => data ?? {}))}');

      await appManager.saveToken(token: response.data!.token);
      await appManager.saveUserInfo(user: response.data!);
      await appManager.saveSignedInStatus(signedInStatus: true);

      emit(state.copyWith(status: SignInStatus.success, data: response.data!));
    } catch (e) {
      emit(state.copyWith(status: SignInStatus.failure, message: e.toString()));
    }
  }

  Future<void> signInBiometric() async {
    try {
      // emit(state.copyWith(status: SignInStatus.loading));

      // final Token? token = await appManager.getToken();

      // String refresh_token = token?.refresh_token ?? '';

      // final response = await repo.refreshToken(refresh_token);

      // await appManager.saveToken(token: response);
      // await appManager.saveSignedInStatus(signedInStatus: true);

      // emit(state.copyWith(status: SignInStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignInStatus.failure, message: e.toString()));
    }
  }
}
