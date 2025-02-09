import 'package:credit_hub_new/src/utils/app_export.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    final int? id,
    @Default(0) final int user_id,
    @Default('') final String username,
    @Default('') final String name,
    @Default('') final String address,
    @Default('') final String token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
