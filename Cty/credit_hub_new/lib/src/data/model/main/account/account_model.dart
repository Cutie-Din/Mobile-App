import 'package:credit_hub_new/src/shared/app_export.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    @Default(0) final int page_no,
    @Default(0) final int page_size,
    @Default('') String lot_no,
    @Default('') String from_date,
    @Default('') String to_date,
    @Default([]) List<DropdownBank> dropdownbank,
    @Default([]) List<AccountDetail> data,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
}
