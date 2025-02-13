import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_request_model.freezed.dart';
part 'dashboard_request_model.g.dart';

@freezed
class RequestDashboard with _$RequestDashboard {
  const factory RequestDashboard({
    final int? id,
    @Default('') String date_request,
    @Default('') String lot_no,
    @Default(0.0) double money_request,
    @Default('') String status_name,
  }) = _RequestDashboard;

  factory RequestDashboard.fromJson(Map<String, dynamic> json) => _$RequestDashboardFromJson(json);
}
