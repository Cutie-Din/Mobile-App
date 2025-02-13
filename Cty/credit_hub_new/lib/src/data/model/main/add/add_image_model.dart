import 'package:credit_hub_new/src/shared/app_export.dart';

part 'add_image_model.freezed.dart';
part 'add_image_model.g.dart';

@freezed
class AddImageModel with _$AddImageModel {
  const factory AddImageModel({
    @Default('') final String url,
  }) = _AddImageModel;

  factory AddImageModel.fromJson(Map<String, dynamic> json) => _$AddImageModelFromJson(json);
}
