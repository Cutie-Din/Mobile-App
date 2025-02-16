import 'package:credit_hub_new/src/shared/app_export.dart';

part 'history_state.freezed.dart';

enum HistoryStatus { initial, loading, success, failure }

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(HistoryStatus.initial) HistoryStatus status,
    @Default([]) List<RequestHistory> data,
    RequestHistory? data_received,
    @Default('') String message,
  }) = _HistoryState;
}
