import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_detail_model.freezed.dart';
part 'account_detail_model.g.dart';

@freezed
class AccountDetail with _$AccountDetail {
  const factory AccountDetail({
    final int? id,
    @Default('') String icons,
    @Default(0) int bank_id,
    @Default('') String bank_name,
    @Default('') String bank_account,
    @Default('') String bank_owner,
  }) = _AccountDetail;

  factory AccountDetail.fromJson(Map<String, dynamic> json) => _$AccountDetailFromJson(json);
}
