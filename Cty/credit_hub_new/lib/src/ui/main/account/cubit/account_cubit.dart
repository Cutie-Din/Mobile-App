import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'account_state.dart';

final logger = getLogger("AccountCubit");

class AccountCubit extends Cubit<AccountState> {
  final MainRepository repo;
  final AppManager appManager;

  AccountCubit(this.repo, this.appManager) : super(const AccountState());
  Future<void> getDropdowbank() async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));

      final response = await repo.getDropdownBank();

      final banks = (response.data as List<dynamic>)
          .map((e) => DropdownBank.fromJson(e as Map<String, dynamic>))
          .toList();
      emit(state.copyWith(status: AccountStatus.success, dropdownbank: banks));
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.failure, message: e.toString()));
    }
  }

  Future<void> createAccount(
      {required int bank_id, required String bank_account, required String bank_owner}) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));

      AccountDetail addModel =
          AccountDetail(bank_id: bank_id, bank_account: bank_account, bank_owner: bank_owner);
      final response = await repo.createAccount(param: addModel);

      logger.d('response: ${response.toJson((data) => data)}');

      if (response.code == '200') {
        emit(state.copyWith(status: AccountStatus.success));
      } else {
        emit(state.copyWith(
          status: AccountStatus.failure,
          message: response.error ?? 'Unknown error',
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.failure, message: e.toString()));
    }
  }
}
