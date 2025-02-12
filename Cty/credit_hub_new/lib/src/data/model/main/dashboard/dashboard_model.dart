import 'package:credit_hub_new/src/data/model/main/dashboard/request_model.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @Default(0) int total_request,
    @Default(0.0) double total_money,
    @Default([]) List<Request> lstRequests,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
}
