import 'package:credit_hub_new/src/data/model/auth/change_password_model.dart';
import 'package:credit_hub_new/src/data/model/auth/forgot_password_param.dart';
import 'package:credit_hub_new/src/data/model/auth/otp_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/utils/app_export.dart';

import 'otp_state.dart';

final logger = getLogger("OtpCubit");

class OtpCubit extends Cubit<OtpState> {
  final AuthRepository repo;
  final AppManager appManager;

  OtpCubit(this.repo, this.appManager) : super(const OtpState());

  Future<void> confirmOtp({required String otp_code}) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));

      OtpModel otp = OtpModel(otp_code: otp_code);
      final response = await repo.confirmOtp(otp: otp);
      logger.d('response, ${response.data.toString()}');
      emit(state.copyWith(status: OtpStatus.success));
    } catch (e) {
      emit(state.copyWith(status: OtpStatus.failure, message: e.toString()));
    }
  }
}
