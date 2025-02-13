import 'package:credit_hub_new/src/shared/app_export.dart';

part 'add_state.freezed.dart';

enum AddStatus { initial, loading, success, failure }

@freezed
class AddState with _$AddState {
  const factory AddState({
    @Default(AddStatus.initial) final AddStatus status,
    @Default(AddModel()) final AddModel data,
    @Default('') final String message,
  }) = _AddState;
}
