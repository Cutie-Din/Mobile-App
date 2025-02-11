import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

import 'forgot_password_state.dart';

final logger = getLogger("ForgotPasswordCubit");

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository repo;
  final AppManager appManager;

  ForgotPasswordCubit(this.repo, this.appManager) : super(const ForgotPasswordState());

  Future<void> sendEmail({required String email}) async {
    try {
      emit(state.copyWith(status: ForgotPasswordStatus.loading));
      ForgotPasswordParam forgotPasswordParam = ForgotPasswordParam(email: email);
      final response = await repo.sendEmail(param: forgotPasswordParam);

      logger.d('response: ${response.toJson((data) => data)}');

      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ForgotPasswordStatus.failure, message: e.toString()));
    }
  }
}
