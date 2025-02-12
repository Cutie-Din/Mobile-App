import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'change_password_state.dart';

final logger = getLogger("ChangePasswordCubit");

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepository repo;
  final AppManager appManager;

  ChangePasswordCubit(this.repo, this.appManager) : super(const ChangePasswordState());

  Future<void> changePassword({
    required String new_password,
    required String old_password,
    required String token,
  }) async {
    try {
      emit(state.copyWith(status: ChangePasswordStatus.loading));
      ChangePasswordModel changePasswordModel =
          ChangePasswordModel(new_password: new_password, old_password: old_password, token: token);
      final response = await repo.changePassword(param: changePasswordModel);

      logger.d('response: ${response.toJson((data) => data)}');

      emit(state.copyWith(status: ChangePasswordStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ChangePasswordStatus.failure, message: e.toString()));
    }
  }
}
