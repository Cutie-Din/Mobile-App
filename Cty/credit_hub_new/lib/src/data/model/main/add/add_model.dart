import 'package:credit_hub_new/src/shared/app_export.dart';

part 'add_model.freezed.dart';
part 'add_model.g.dart';

@freezed
class AddModel with _$AddModel {
  const factory AddModel({
    @Default('') final String lot_no,
    @Default(0.0) final double money_request,
    @Default('') final String image_link,
  }) = _AddModel;

  factory AddModel.fromJson(Map<String, dynamic> json) => _$AddModelFromJson(json);
}
