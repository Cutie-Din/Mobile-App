import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

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

      logger.d('response: ${response.toJson((data) => data)}');

      if (response.code == '200') {
        emit(state.copyWith(status: OtpStatus.success));
      } else {
        emit(state.copyWith(
          status: OtpStatus.failure,
          message: response.error ?? 'Unknown error',
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: OtpStatus.failure, message: e.toString()));
    }
  }
}
