import 'package:credit_hub_new/src/shared/app_export.dart';

part 'dashboard_state.freezed.dart';

enum DashboardStatus { initial, loading, success, failure }

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DashboardStatus.initial) final DashboardStatus status,
    @Default(DashboardModel()) final DashboardModel data,
    @Default('') final String message,
  }) = _DashboardState;
}
