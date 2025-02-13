import 'dart:io';

import 'package:credit_hub_new/src/shared/app_export.dart';

part 'add_image_state.freezed.dart';

enum AddImageStatus { initial, loading, success, failure }

@freezed
class AddImageState with _$AddImageState {
  const factory AddImageState({
    @Default(AddImageStatus.initial) final AddImageStatus status,
    @Default(AddImageModel()) final AddImageModel data,
    @Default('') final String message,
    final File? imageFile,
  }) = _AddImageState;
}
