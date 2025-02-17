import 'package:credit_hub_new/src/shared/app_export.dart';

part 'account_state.freezed.dart';

enum AccountStatus { initial, loading, success, failure }

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(AccountStatus.initial) final AccountStatus status,
    @Default([]) List<DropdownBank> dropdownbank,
    DropdownBank? bank,
    @Default([]) List<AccountDetail> accounts,
    AccountDetail? accountdetail,
    @Default('') final String message,
  }) = _AccountState;
}
