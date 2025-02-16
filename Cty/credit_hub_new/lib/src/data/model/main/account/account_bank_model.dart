import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_bank_model.freezed.dart';
part 'account_bank_model.g.dart';

@freezed
class DropdownBank with _$DropdownBank {
  const factory DropdownBank({
    final int? id,
    @Default('') String avatar,
    @Default('') String name,
    @Default('') String description,
  }) = _DropdownBank;

  factory DropdownBank.fromJson(Map<String, dynamic> json) => _$DropdownBankFromJson(json);
}
