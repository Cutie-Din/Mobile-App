import 'package:credit_hub_new/src/shared/app_export.dart';

part 'history_state.freezed.dart';

enum HistoryStatus { initial, loading, success, failure }

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(HistoryStatus.initial) final HistoryStatus status,
    @Default(HistoryModel()) final HistoryModel data,
    @Default('') final String message,
  }) = _HistoryState;
}
